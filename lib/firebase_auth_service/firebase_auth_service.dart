library firebase_auth_service;

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_core/localization/flutter_app_core_l10n.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

part 'firebase_auth_errors.dart';
part 'firebase_auth_service.g.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static final instance = FirebaseAuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
  Stream<User?> userChanges() => _firebaseAuth.userChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<Map<String, dynamic>> parsePhoneNumber(
    CountryWithPhoneCode country,
    String inputText,
  ) async {
    final formattedNumber =
        '+${country.phoneCode}${inputText.replaceAll(RegExp(r'[^0-9]'), '')}';

    final phoneNumber = await FlutterLibphonenumber().parse(
      formattedNumber,
      region: country.countryCode,
    );

    if (phoneNumber['type'] != 'mobile') {
      throw FirebaseAuthException(code: 'phone-not-mobile');
    }

    return phoneNumber;
  }

  Future<void> verifyPhone(
    String phoneNumber,
    Function(String verificationId) completion,
  ) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        completion(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completion(verificationId);
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<User?> verifyCode(
    String verificationId,
    String verificationCode,
  ) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<UserCredential> _signInWithCredential(
      AuthCredential credential) async {
    if (currentUser != null) {
      final isAnonymous = currentUser!.isAnonymous;
      final userCredential = await currentUser!.linkWithCredential(credential);

      if (isAnonymous) {
        await updateEmail(userCredential.user!.email!);
      }
      return userCredential;
    } else {
      return await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<User?> signInWithApple() async {
    final scopes = [Scope.email, Scope.fullName];

    final result = await TheAppleSignIn.performRequests(
      [AppleIdRequest(requestedScopes: scopes)],
    );

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential = await _signInWithCredential(credential);

        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_AUTHORIZATION_DENIED',
        );

      case AuthorizationStatus.cancelled:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
        );
      default:
        throw UnimplementedError();
    }
  }

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final userCredential = await _signInWithCredential(credential);
        return userCredential.user;
      } else {
        throw FirebaseAuthException(code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
      }
    } else {
      throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
    }
  }

  Future<void> sendSignInLinkToEmail({
    required String email,
    required String url,
  }) async {
    await _firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: url,
        handleCodeInApp: true,
      ),
    );
  }

  Future<User?> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailLink(
      email: email,
      emailLink: emailLink,
    );
    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (currentUser != null) {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential = await _signInWithCredential(credential);
      return userCredential.user;
    } else {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      return user;
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> updateEmail(String newEmail) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserEmail')
        .call({'email': newEmail});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> updatePassword(String newPassword) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserPassword')
        .call({'password': newPassword});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> deleteAccount() async {
    await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('deleteUser')
        .call();

    await signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User> unlink(String providerId) async {
    return await currentUser!.unlink(providerId);
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authServiceProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
Stream<User?> userChanges(UserChangesRef ref) {
  return ref.watch(authServiceProvider).userChanges();
}

/// A provider which returns an instance of [FirebaseAuthService]
@Riverpod(keepAlive: true)
FirebaseAuthService authService(AuthServiceRef ref) =>
    FirebaseAuthService.instance;

/*
@Riverpod(keepAlive: true)
class FirebaseUser extends _$FirebaseUser {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> build() {
    return _firebaseAuth.authStateChanges();
  }

  Stream<User?> changes() {
    return _firebaseAuth.userChanges();
  }

  Future<Map<String, dynamic>> parsePhoneNumber(
    CountryWithPhoneCode country,
    String inputText,
  ) async {
    final formattedNumber =
        '+${country.phoneCode}${inputText.replaceAll(RegExp(r'[^0-9]'), '')}';

    final phoneNumber = await FlutterLibphonenumber().parse(
      formattedNumber,
      region: country.countryCode,
    );

    if (phoneNumber['type'] != 'mobile') {
      throw FirebaseAuthException(code: 'phone-not-mobile');
    }

    return phoneNumber;
  }

  Future<void> verifyPhone(
    String phoneNumber,
    Function(String verificationId) completion,
  ) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        completion(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completion(verificationId);
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<User?> verifyCode(
    String verificationId,
    String verificationCode,
  ) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<UserCredential> _signInWithCredential(
      AuthCredential credential) async {
    if (_firebaseAuth.currentUser != null) {
      final isAnonymous = _firebaseAuth.currentUser!.isAnonymous;
      final userCredential =
          await _firebaseAuth.currentUser!.linkWithCredential(credential);

      if (isAnonymous) {
        await updateEmail(userCredential.user!.email!);
      }
      return userCredential;
    } else {
      return await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<User?> signInWithApple() async {
    final scopes = [Scope.email, Scope.fullName];

    final result = await TheAppleSignIn.performRequests(
      [AppleIdRequest(requestedScopes: scopes)],
    );

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential = await _signInWithCredential(credential);

        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_AUTHORIZATION_DENIED',
        );

      case AuthorizationStatus.cancelled:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
        );
      default:
        throw UnimplementedError();
    }
  }

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final userCredential = await _signInWithCredential(credential);
        return userCredential.user;
      } else {
        throw FirebaseAuthException(code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
      }
    } else {
      throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
    }
  }

  Future<void> sendSignInLinkToEmail({
    required String email,
    required String url,
  }) async {
    await _firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: url,
        handleCodeInApp: true,
      ),
    );
  }

  Future<User?> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailLink(
      email: email,
      emailLink: emailLink,
    );
    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (_firebaseAuth.currentUser != null) {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential = await _signInWithCredential(credential);
      return userCredential.user;
    } else {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      return user;
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> updateEmail(String newEmail) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserEmail')
        .call({'email': newEmail});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> updatePassword(String newPassword) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserPassword')
        .call({'password': newPassword});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> deleteAccount() async {
    await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('deleteUser')
        .call();

    await signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User> unlink(String providerId) async {
    return await _firebaseAuth.currentUser!.unlink(providerId);
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
*/