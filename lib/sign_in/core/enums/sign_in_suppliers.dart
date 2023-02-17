part of sign_in;

enum SignInSupplier {
  anonymous,
  emailLink,
  email,
  google,
  apple,
  phone,
}

extension SignInSupplierX on SignInSupplier {
  bool get isThirdParty {
    switch (this) {
      case SignInSupplier.google:
      case SignInSupplier.apple:
        return true;
      default:
        return false;
    }
  }

  String name(FlutterAppCoreLocalizations l10n) {
    switch (this) {
      case SignInSupplier.google:
        return "Google";
      case SignInSupplier.apple:
        return "Apple";
      case SignInSupplier.email:
        return l10n.signInWithEmail;
      case SignInSupplier.emailLink:
        return l10n.signInWithEmailLink;
      default:
        return "";
    }
  }

  String get id {
    switch (this) {
      case SignInSupplier.google:
        return "google.com";
      case SignInSupplier.apple:
        return "apple.com";
      default:
        return "";
    }
  }

  Widget icon({double size = 16, Color? color}) {
    switch (this) {
      case SignInSupplier.google:
        return SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: GoogleLogoPainter(),
          ),
        );
      case SignInSupplier.apple:
        return SizedBox(
          width: size,
          height: size / (25 / 31),
          child: CustomPaint(
            painter: AppleLogoPainter(
              color: color!,
            ),
          ),
        );
      case SignInSupplier.email:
      case SignInSupplier.emailLink:
        return Icon(
          Icons.email_outlined,
          color: color,
          size: size * 1.2,
        );
      case SignInSupplier.phone:
        return Icon(
          Icons.phone_android,
          color: color,
          size: size * 1.2,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  SignInButtonsEvent get signInButtonsEvent {
    switch (this) {
      case SignInSupplier.google:
        return const SignInButtonsEvent.signInWithGoogle();
      case SignInSupplier.apple:
        return const SignInButtonsEvent.signInWithApple();
      case SignInSupplier.anonymous:
        return const SignInButtonsEvent.signInAnonymously();
      case SignInSupplier.emailLink:
        return const SignInButtonsEvent.signInWithEmailLink("");
      case SignInSupplier.email:
        return const SignInButtonsEvent.signInWithEmail();
      case SignInSupplier.phone:
        return const SignInButtonsEvent.signInWithPhone();
    }
  }
}
