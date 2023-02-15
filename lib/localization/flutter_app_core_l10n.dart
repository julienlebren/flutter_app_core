import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'flutter_app_core_l10n_en.dart';
import 'flutter_app_core_l10n_fr.dart';

/// Callers can lookup localized strings with an instance of FlutterAppCoreLocalizations
/// returned by `FlutterAppCoreLocalizations.of(context)`.
///
/// Applications need to include `FlutterAppCoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/flutter_app_core_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FlutterAppCoreLocalizations.localizationsDelegates,
///   supportedLocales: FlutterAppCoreLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FlutterAppCoreLocalizations.supportedLocales
/// property.
abstract class FlutterAppCoreLocalizations {
  FlutterAppCoreLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FlutterAppCoreLocalizations? of(BuildContext context) {
    return Localizations.of<FlutterAppCoreLocalizations>(context, FlutterAppCoreLocalizations);
  }

  static const LocalizationsDelegate<FlutterAppCoreLocalizations> delegate = _FlutterAppCoreLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysAgo(String days);

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'yesterday'**
  String get yesterday;

  /// No description provided for @oneHourAgo.
  ///
  /// In en, this message translates to:
  /// **'1 hour ago'**
  String get oneHourAgo;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String hoursAgo(String hours);

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes ago'**
  String minutesAgo(String minutes);

  /// No description provided for @oneMinuteAgo.
  ///
  /// In en, this message translates to:
  /// **'1 minute ago'**
  String get oneMinuteAgo;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @annualCaption.
  ///
  /// In en, this message translates to:
  /// **'Annual subscription'**
  String get annualCaption;

  /// No description provided for @annualPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/year'**
  String annualPrice(String price);

  /// No description provided for @annualDiscount.
  ///
  /// In en, this message translates to:
  /// **'i.e. {discount}% off'**
  String annualDiscount(String discount);

  /// No description provided for @closeAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'A purchase is currently in progress, are you sure you want to leave now?'**
  String get closeAlertTitle;

  /// No description provided for @closeAlertCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Yes, leave this view'**
  String get closeAlertCloseButton;

  /// No description provided for @closeAlertCancelButton.
  ///
  /// In en, this message translates to:
  /// **'No, wait for the end of the purchase'**
  String get closeAlertCancelButton;

  /// No description provided for @cupertinoDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.'**
  String get cupertinoDisclaimer;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong...'**
  String get errorTitle;

  /// No description provided for @monthlyCaption.
  ///
  /// In en, this message translates to:
  /// **'Monthly subscription'**
  String get monthlyCaption;

  /// No description provided for @monthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/month'**
  String monthlyPrice(String price);

  /// No description provided for @priceNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Unable to contact Store at the moment.'**
  String get priceNotLoaded;

  /// No description provided for @privacyPolicyButton.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyButton;

  /// No description provided for @purchaseInProgress.
  ///
  /// In en, this message translates to:
  /// **'Purchase in progress, please wait...'**
  String get purchaseInProgress;

  /// No description provided for @restoreButton.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restoreButton;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @termsButton.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsButton;

  /// No description provided for @sixMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'6 months subscription'**
  String get sixMonthCaption;

  /// No description provided for @sixMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/6 months'**
  String sixMonthPrice(String price);

  /// No description provided for @threeMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'3 months subscription'**
  String get threeMonthCaption;

  /// No description provided for @threeMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/3 months'**
  String threeMonthPrice(String price);

  /// No description provided for @twoMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'2 months subscription'**
  String get twoMonthCaption;

  /// No description provided for @twoMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/2 months'**
  String twoMonthPrice(String price);

  /// No description provided for @weeklyCaption.
  ///
  /// In en, this message translates to:
  /// **'Weekly subscription'**
  String get weeklyCaption;

  /// No description provided for @weeklyPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/week'**
  String weeklyPrice(String price);

  /// No description provided for @noSubscriptionToRestore.
  ///
  /// In en, this message translates to:
  /// **'There is no active subscription to restore.'**
  String get noSubscriptionToRestore;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @errorDescription.
  ///
  /// In en, this message translates to:
  /// **'We are unable to handle your request at the moment.'**
  String get errorDescription;

  /// No description provided for @networkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'You are currently not connected to the internet'**
  String get networkErrorTitle;

  /// No description provided for @networkErrorCaption.
  ///
  /// In en, this message translates to:
  /// **'The app requires an internet connection to work, please check your connection settings'**
  String get networkErrorCaption;

  /// No description provided for @networkErrorWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for connection...'**
  String get networkErrorWaiting;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @countriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Country / Region'**
  String get countriesTitle;

  /// No description provided for @emailResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password'**
  String get emailResetTitle;

  /// No description provided for @emailResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send you a link to reset your password.'**
  String get emailResetSubtitle;

  /// No description provided for @emailResetSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get emailResetSubmitButton;

  /// No description provided for @emailResetSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Please check your email'**
  String get emailResetSuccessTitle;

  /// No description provided for @emailResetSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'We just sent a link at {email} to reset your password.'**
  String emailResetSuccessDescription(String email);

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'The password must meet the following conditions:'**
  String get passwordRequirements;

  /// No description provided for @passwordRequirementMinLength.
  ///
  /// In en, this message translates to:
  /// **'Aleast 6 characters'**
  String get passwordRequirementMinLength;

  /// No description provided for @passwordRequirementUppercase.
  ///
  /// In en, this message translates to:
  /// **'At least one capital letter'**
  String get passwordRequirementUppercase;

  /// No description provided for @passwordRequirementLowercase.
  ///
  /// In en, this message translates to:
  /// **'At least a lowercase'**
  String get passwordRequirementLowercase;

  /// No description provided for @passwordRequirementDigits.
  ///
  /// In en, this message translates to:
  /// **'At least one number'**
  String get passwordRequirementDigits;

  /// No description provided for @passwordRequirementSpecialChars.
  ///
  /// In en, this message translates to:
  /// **'At least one special character'**
  String get passwordRequirementSpecialChars;

  /// No description provided for @passwordRequirementMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get passwordRequirementMatch;

  /// No description provided for @settingsAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccountTitle;

  /// No description provided for @settingsCreateAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get settingsCreateAccountButton;

  /// No description provided for @settingsCreateAccountWith.
  ///
  /// In en, this message translates to:
  /// **'Create an account with {supplier}'**
  String settingsCreateAccountWith(String supplier);

  /// No description provided for @settingsNoAccount.
  ///
  /// In en, this message translates to:
  /// **'You are currently not logged in, your settings and other data are not saved and may be lost. Tap here to create an account.'**
  String get settingsNoAccount;

  /// No description provided for @settingsDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteTitle;

  /// No description provided for @settingsDeleteCaption.
  ///
  /// In en, this message translates to:
  /// **'Your account information, profile, and all data stored in the app will be deleted.'**
  String get settingsDeleteCaption;

  /// No description provided for @settingsDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteButton;

  /// No description provided for @settingsDeleteAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to continue ? This action is irreversible.'**
  String get settingsDeleteAlertTitle;

  /// No description provided for @settingsEmailSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Login information'**
  String get settingsEmailSectionTitle;

  /// No description provided for @settingsEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get settingsEmailLabel;

  /// No description provided for @settingsEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get settingsEmailTitle;

  /// No description provided for @settingsEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'New email address'**
  String get settingsEmailPlaceholder;

  /// No description provided for @settingsPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPasswordTitle;

  /// No description provided for @settingsPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPasswordLabel;

  /// No description provided for @settingsPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get settingsPasswordPlaceholder;

  /// No description provided for @settingsPasswordConfirmationPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get settingsPasswordConfirmationPlaceholder;

  /// No description provided for @settingsPasswordEdit.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get settingsPasswordEdit;

  /// No description provided for @settingsPasswordUndefinedCaption.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t set a password yet, so you won\'t be able to log in to your account using your email address and password. Only login with third-party account will work.'**
  String get settingsPasswordUndefinedCaption;

  /// No description provided for @settingsThirdPartySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Login with a third-party account'**
  String get settingsThirdPartySectionTitle;

  /// No description provided for @settingsThirdPartyConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get settingsThirdPartyConnected;

  /// No description provided for @settingsThirdPartyNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get settingsThirdPartyNotConnected;

  /// No description provided for @settingsThirdPartyCaption.
  ///
  /// In en, this message translates to:
  /// **'You can combine several connection methods to secure access to your account.'**
  String get settingsThirdPartyCaption;

  /// No description provided for @settingsLogoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogoutButton;

  /// No description provided for @settingsLogoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get settingsLogoutConfirmation;

  /// No description provided for @settingsUndefined.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get settingsUndefined;

  /// No description provided for @signInAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Continue without registration'**
  String get signInAnonymously;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Continue with {supplier}'**
  String signInWith(String supplier);

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'e-mail'**
  String get signInWithEmail;

  /// No description provided for @signInWithEmailLink.
  ///
  /// In en, this message translates to:
  /// **'e-mail'**
  String get signInWithEmailLink;

  /// No description provided for @signInWithEmailLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with e-mail'**
  String get signInWithEmailLinkTitle;

  /// No description provided for @signInWithEmailLinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No password required, we just send you an email with a link to log in to the app.'**
  String get signInWithEmailLinkSubtitle;

  /// No description provided for @signInWithEmailLinkSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check your email, we have sent a sign-in link.'**
  String get signInWithEmailLinkSuccess;

  /// No description provided for @signInWithEmailLinkRetry.
  ///
  /// In en, this message translates to:
  /// **'You did not receive it? Try again or try another identification method.'**
  String get signInWithEmailLinkRetry;

  /// No description provided for @signInWithEmailCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Not yet registered? Create an account here.'**
  String get signInWithEmailCreateAccount;

  /// No description provided for @signInWithEmailForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get signInWithEmailForgotPassword;

  /// No description provided for @signInWithEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get signInWithEmailPlaceholder;

  /// No description provided for @signInWithEmailPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInWithEmailPasswordPlaceholder;

  /// No description provided for @signInWithEmailAlreadyAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in here.'**
  String get signInWithEmailAlreadyAccount;

  /// No description provided for @signInWithEmailRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signInWithEmailRegisterButton;

  /// No description provided for @signInWithEmailRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with e-mail'**
  String get signInWithEmailRegisterTitle;

  /// No description provided for @signInWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with e-mail'**
  String get signInWithEmailTitle;

  /// No description provided for @signInWithEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No password required, we just send you an email with a link to log in to the app.'**
  String get signInWithEmailSubtitle;

  /// No description provided for @signInWithEmailInvalidPasswordConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signInWithEmailInvalidPasswordConfirmation;

  /// No description provided for @signInWithPhone.
  ///
  /// In en, this message translates to:
  /// **'phone number'**
  String get signInWithPhone;

  /// No description provided for @signInPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get signInPhoneTitle;

  /// No description provided for @signInPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will send an SMS to confirm your number, it won\'t cost you nothing.'**
  String get signInPhoneSubtitle;

  /// No description provided for @signInPhonePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Example: {example}'**
  String signInPhonePlaceholder(String example);

  /// No description provided for @signInPhoneAutoRetrieve.
  ///
  /// In en, this message translates to:
  /// **'You may not need to enter the code as the app will attempt to detect it automatically.'**
  String get signInPhoneAutoRetrieve;

  /// No description provided for @signInPhoneLoadingDialog.
  ///
  /// In en, this message translates to:
  /// **'Waiting for automatic code detection ...'**
  String get signInPhoneLoadingDialog;

  /// No description provided for @signInVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Number verification'**
  String get signInVerificationTitle;

  /// No description provided for @signInVerificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code we sent to {phoneNumber}'**
  String signInVerificationSubtitle(String phoneNumber);

  /// No description provided for @signInVerificationNotReceived.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the code?\nWait {seconds} seconds...'**
  String signInVerificationNotReceived(String seconds);

  /// No description provided for @signInVerificationResend.
  ///
  /// In en, this message translates to:
  /// **'Resend the code'**
  String get signInVerificationResend;

  /// No description provided for @errorExpiredActionCode.
  ///
  /// In en, this message translates to:
  /// **'This link is no longer valid.'**
  String get errorExpiredActionCode;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'This email address is not valid.'**
  String get errorInvalidEmail;

  /// No description provided for @errorInvalidVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code!'**
  String get errorInvalidVerificationCode;

  /// No description provided for @errorUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled.'**
  String get errorUserDisabled;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'There is no account registered with this email address.'**
  String get errorUserNotFound;

  /// No description provided for @errorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password.'**
  String get errorWrongPassword;

  /// No description provided for @errorEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account is already registered with this email address.'**
  String get errorEmailAlreadyInUse;

  /// No description provided for @errorCredentialAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account is already linked to this {provider} account.'**
  String errorCredentialAlreadyInUse(String provider);

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'This password is not strong enough.'**
  String get errorWeakPassword;

  /// No description provided for @errorOperationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'This operation is not allowed.'**
  String get errorOperationNotAllowed;

  /// No description provided for @errorPhoneNotMobile.
  ///
  /// In en, this message translates to:
  /// **'You must enter a mobile phone number.'**
  String get errorPhoneNotMobile;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error has occurred.'**
  String get errorUnknown;

  /// No description provided for @unlinkTitle.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get unlinkTitle;

  /// No description provided for @unlinkProvider.
  ///
  /// In en, this message translates to:
  /// **'Disconnect {provider}'**
  String unlinkProvider(String provider);
}

class _FlutterAppCoreLocalizationsDelegate extends LocalizationsDelegate<FlutterAppCoreLocalizations> {
  const _FlutterAppCoreLocalizationsDelegate();

  @override
  Future<FlutterAppCoreLocalizations> load(Locale locale) {
    return SynchronousFuture<FlutterAppCoreLocalizations>(lookupFlutterAppCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_FlutterAppCoreLocalizationsDelegate old) => false;
}

FlutterAppCoreLocalizations lookupFlutterAppCoreLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return FlutterAppCoreLocalizationsEn();
    case 'fr': return FlutterAppCoreLocalizationsFr();
  }

  throw FlutterError(
    'FlutterAppCoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
