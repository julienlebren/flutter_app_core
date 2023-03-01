import 'flutter_app_core_l10n.dart';

/// The translations for English (`en`).
class FlutterAppCoreLocalizationsEn extends FlutterAppCoreLocalizations {
  FlutterAppCoreLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String daysAgo(String days) {
    return '$days days ago';
  }

  @override
  String get yesterday => 'yesterday';

  @override
  String get oneHourAgo => '1 hour ago';

  @override
  String hoursAgo(String hours) {
    return '$hours hours ago';
  }

  @override
  String minutesAgo(String minutes) {
    return '$minutes minutes ago';
  }

  @override
  String get oneMinuteAgo => '1 minute ago';

  @override
  String get justNow => 'Just now';

  @override
  String get annualCaption => 'Annual subscription';

  @override
  String annualPrice(String price) {
    return '$price/year';
  }

  @override
  String annualDiscount(String discount) {
    return 'i.e. $discount% off';
  }

  @override
  String get closeAlertTitle => 'A purchase is currently in progress, are you sure you want to leave now?';

  @override
  String get closeAlertCloseButton => 'Yes, leave this view';

  @override
  String get closeAlertCancelButton => 'No, wait for the end of the purchase';

  @override
  String get cupertinoDisclaimer => 'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.';

  @override
  String get errorTitle => 'Oops! Something went wrong...';

  @override
  String get monthlyCaption => 'Monthly subscription';

  @override
  String monthlyPrice(String price) {
    return '$price/month';
  }

  @override
  String get priceNotLoaded => 'Unable to contact Store at the moment.';

  @override
  String get privacyPolicyButton => 'Privacy policy';

  @override
  String get purchaseInProgress => 'Purchase in progress, please wait...';

  @override
  String get restoreButton => 'Restore purchases';

  @override
  String get retryButton => 'Retry';

  @override
  String get termsButton => 'Terms of Use';

  @override
  String get sixMonthCaption => '6 months subscription';

  @override
  String sixMonthPrice(String price) {
    return '$price/6 months';
  }

  @override
  String get threeMonthCaption => '3 months subscription';

  @override
  String threeMonthPrice(String price) {
    return '$price/3 months';
  }

  @override
  String get twoMonthCaption => '2 months subscription';

  @override
  String twoMonthPrice(String price) {
    return '$price/2 months';
  }

  @override
  String get weeklyCaption => 'Weekly subscription';

  @override
  String weeklyPrice(String price) {
    return '$price/week';
  }

  @override
  String get noSubscriptionToRestore => 'There is no active subscription to restore.';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get errorDescription => 'We are unable to handle your request at the moment.';

  @override
  String get networkErrorTitle => 'You are currently not connected to the internet';

  @override
  String get networkErrorCaption => 'The app requires an internet connection to work, please check your connection settings';

  @override
  String get networkErrorWaiting => 'Waiting for connection...';

  @override
  String get continueButton => 'Continue';

  @override
  String get countriesTitle => 'Country / Region';

  @override
  String get emailResetTitle => 'Forgot your password';

  @override
  String get emailResetSubtitle => 'Enter your email and we\'ll send you a link to reset your password.';

  @override
  String get emailResetSubmitButton => 'Reset your password';

  @override
  String get emailResetSuccessTitle => 'Please check your email';

  @override
  String emailResetSuccessDescription(String email) {
    return 'We just sent a link at $email to reset your password.';
  }

  @override
  String get passwordRequirements => 'The password must meet the following conditions:';

  @override
  String get passwordRequirementMinLength => 'Aleast 6 characters';

  @override
  String get passwordRequirementUppercase => 'At least one capital letter';

  @override
  String get passwordRequirementLowercase => 'At least a lowercase';

  @override
  String get passwordRequirementDigits => 'At least one number';

  @override
  String get passwordRequirementSpecialChars => 'At least one special character';

  @override
  String get passwordRequirementMatch => 'Passwords match';

  @override
  String get settingsAccountTitle => 'Account';

  @override
  String get settingsCreateAccountButton => 'Create an account';

  @override
  String settingsCreateAccountWith(String supplier) {
    return 'Create an account with $supplier';
  }

  @override
  String get settingsNoAccount => 'You are currently not logged in, your settings and other data are not saved and may be lost. Tap here to create an account.';

  @override
  String get settingsDeleteTitle => 'Delete account';

  @override
  String get settingsDeleteCaption => 'Your account information, profile, and all data stored in the app will be deleted.';

  @override
  String get settingsDeleteButton => 'Delete account';

  @override
  String get settingsDeleteAlertTitle => 'Are you sure you want to continue ? This action is irreversible.';

  @override
  String get settingsEmailSectionTitle => 'Login information';

  @override
  String get settingsEmailLabel => 'Email address';

  @override
  String get settingsEmailTitle => 'Email address';

  @override
  String get settingsEmailPlaceholder => 'New email address';

  @override
  String get settingsPasswordTitle => 'Password';

  @override
  String get settingsPasswordLabel => 'Password';

  @override
  String get settingsPasswordPlaceholder => 'New password';

  @override
  String get settingsPasswordConfirmationPlaceholder => 'Confirm password';

  @override
  String get settingsPasswordEdit => 'Change';

  @override
  String get settingsPasswordUndefinedCaption => 'You haven\'t set a password yet, so you won\'t be able to log in to your account using your email address and password. Only login with third-party account will work.';

  @override
  String get settingsThirdPartySectionTitle => 'Login with a third-party account';

  @override
  String get settingsThirdPartyConnected => 'Connected';

  @override
  String get settingsThirdPartyNotConnected => 'Not connected';

  @override
  String get settingsThirdPartyCaption => 'You can combine several connection methods to secure access to your account.';

  @override
  String get settingsLogoutButton => 'Logout';

  @override
  String get settingsLogoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get settingsUndefined => 'Not set';

  @override
  String get signInAnonymously => 'Continue without registration';

  @override
  String get signInNoSupplier => 'No auth provider has been set for this app.';

  @override
  String signInWith(String supplier) {
    return 'Continue with $supplier';
  }

  @override
  String get signInWithEmail => 'e-mail';

  @override
  String get signInWithEmailLink => 'e-mail';

  @override
  String get signInWithEmailLinkTitle => 'Sign in with e-mail';

  @override
  String get signInWithEmailLinkSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailLinkSuccess => 'Check your email, we have sent a sign-in link.';

  @override
  String get signInWithEmailLinkRetry => 'You did not receive it? Try again or try another identification method.';

  @override
  String get signInWithEmailCreateAccount => 'Not yet registered? Create an account here.';

  @override
  String get signInWithEmailForgotPassword => 'Forgot your password?';

  @override
  String get signInWithEmailPlaceholder => 'Email address';

  @override
  String get signInWithEmailPasswordPlaceholder => 'Password';

  @override
  String get signInWithEmailAlreadyAccount => 'Already have an account? Sign in here.';

  @override
  String get signInWithEmailRegisterButton => 'Register';

  @override
  String get signInWithEmailRegisterTitle => 'Sign up with e-mail';

  @override
  String get signInWithEmailTitle => 'Sign in with e-mail';

  @override
  String get signInWithEmailSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailInvalidPasswordConfirmation => 'Passwords do not match';

  @override
  String get signInWithPhone => 'phone number';

  @override
  String get signInPhoneTitle => 'Phone Number';

  @override
  String get signInPhoneSubtitle => 'We will send an SMS to confirm your number, it won\'t cost you nothing.';

  @override
  String signInPhonePlaceholder(String example) {
    return 'Example: $example';
  }

  @override
  String get signInPhoneAutoRetrieve => 'You may not need to enter the code as the app will attempt to detect it automatically.';

  @override
  String get signInPhoneLoadingDialog => 'Waiting for automatic code detection ...';

  @override
  String get signInVerificationTitle => 'Number verification';

  @override
  String signInVerificationSubtitle(String phoneNumber) {
    return 'Enter the 6-digit code we sent to $phoneNumber';
  }

  @override
  String signInVerificationNotReceived(String seconds) {
    return 'Did not receive the code?\nWait $seconds seconds...';
  }

  @override
  String get signInVerificationResend => 'Resend the code';

  @override
  String get errorExpiredActionCode => 'This link is no longer valid.';

  @override
  String get errorInvalidEmail => 'This email address is not valid.';

  @override
  String get errorInvalidVerificationCode => 'Invalid verification code!';

  @override
  String get errorUserDisabled => 'This account has been disabled.';

  @override
  String get errorUserNotFound => 'There is no account registered with this email address.';

  @override
  String get errorWrongPassword => 'Wrong password.';

  @override
  String get errorEmailAlreadyInUse => 'An account is already registered with this email address.';

  @override
  String errorCredentialAlreadyInUse(String provider) {
    return 'An account is already linked to this $provider account.';
  }

  @override
  String get errorWeakPassword => 'This password is not strong enough.';

  @override
  String get errorOperationNotAllowed => 'This operation is not allowed.';

  @override
  String get errorPhoneNotMobile => 'You must enter a mobile phone number.';

  @override
  String get errorUnknown => 'An unknown error has occurred.';

  @override
  String get unlinkTitle => 'What do you want to do?';

  @override
  String unlinkProvider(String provider) {
    return 'Disconnect $provider';
  }
}
