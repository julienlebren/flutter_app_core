import 'flutter_app_core_l10n.dart';

/// The translations for French (`fr`).
class FlutterAppCoreLocalizationsFr extends FlutterAppCoreLocalizations {
  FlutterAppCoreLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String daysAgo(String days) {
    return 'il y a $days jours';
  }

  @override
  String get yesterday => 'hier';

  @override
  String get oneHourAgo => '1 hour ago';

  @override
  String hoursAgo(String hours) {
    return 'il y a $hours heures';
  }

  @override
  String minutesAgo(String minutes) {
    return 'il y a $minutes minutes';
  }

  @override
  String get oneMinuteAgo => '1 minute ago';

  @override
  String get justNow => 'À l\'instant';

  @override
  String get annualCaption => 'Abonnement annuel';

  @override
  String annualPrice(String price) {
    return '$price/an';
  }

  @override
  String annualDiscount(String discount) {
    return 'soit $discount% de réduction';
  }

  @override
  String get closeAlertTitle => 'Un achat est actuellement en cours, êtes-vous sûr de vouloir quitter maintenant ?';

  @override
  String get closeAlertCloseButton => 'Oui, quitter cette vue';

  @override
  String get closeAlertCancelButton => 'Non, attendre la fin de l\'achat';

  @override
  String get cupertinoDisclaimer => 'Le paiement sera effectué sur le compte iTunes et l\'abonnement se renouvellera automatiquement à moins que le renouvellement automatique ne soit désactivé au moins 24 heures avant la fin de la période en cours. Le compte sera facturé pour le renouvellement dans les 24 heures précédant la fin de la période en cours. Gérez le renouvellement automatique en accédant à l\'application Paramètres de votre appareil.';

  @override
  String get errorTitle => 'Il y a eu un problème...';

  @override
  String get monthlyCaption => 'Abonnement mensuel';

  @override
  String monthlyPrice(String price) {
    return '$price/mois';
  }

  @override
  String get priceNotLoaded => 'Impossible d\'accéder au Store pour le moment.';

  @override
  String get privacyPolicyButton => 'Politique de confidentialité';

  @override
  String get purchaseInProgress => 'Achat en cours, veuillez patienter...';

  @override
  String get restoreButton => 'Restaurer les achats';

  @override
  String get retryButton => 'Réessayer';

  @override
  String get termsButton => 'Conditions d\'utilisation';

  @override
  String get sixMonthCaption => 'Abonnement pour 6 mois';

  @override
  String sixMonthPrice(String price) {
    return '$price/6 mois';
  }

  @override
  String get threeMonthCaption => 'Abonnement pour 3 mois';

  @override
  String threeMonthPrice(String price) {
    return '$price/3 mois';
  }

  @override
  String get twoMonthCaption => 'Abonnement pour 2 mois';

  @override
  String twoMonthPrice(String price) {
    return '$price/2 mois';
  }

  @override
  String get weeklyCaption => 'Abonnement hebdommadaire';

  @override
  String weeklyPrice(String price) {
    return '$price/semaine';
  }

  @override
  String get noSubscriptionToRestore => 'Il n\'y a aucun abonnement actif à restaurer.';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get system => 'Système';

  @override
  String get errorDescription => 'Nous ne pouvons pas traiter votre requête pour le moment.';

  @override
  String get networkErrorTitle => 'Vous n\'êtes actuellement pas connecté à internet';

  @override
  String get networkErrorCaption => 'L\'app nécessite une connexion internet pour fonctionner, merci de vérifier vos paramètres de connexion';

  @override
  String get networkErrorWaiting => 'En attente de connexion...';

  @override
  String get continueButton => 'Continuer';

  @override
  String get countriesTitle => 'Pays / Région';

  @override
  String get emailResetTitle => 'Mot de passe oublié';

  @override
  String get emailResetSubtitle => 'Saisissez votre e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String get emailResetSubmitButton => 'Rénitialiser le mot de passe';

  @override
  String get emailResetSuccessTitle => 'Vérifiez vos e-mails';

  @override
  String emailResetSuccessDescription(String email) {
    return 'Nous venons d\'envoyer un lien sur $email un lien pour réinitialiser votre mot de passe.';
  }

  @override
  String get passwordRequirements => 'Le mot de passe doit remplir les conditions suivantes :';

  @override
  String get passwordRequirementMinLength => '6 caractères minimum';

  @override
  String get passwordRequirementUppercase => 'Au moins une majuscule';

  @override
  String get passwordRequirementLowercase => 'Au moins une minuscule';

  @override
  String get passwordRequirementDigits => 'Au moins un chiffre';

  @override
  String get passwordRequirementSpecialChars => 'Au moins un caractère spécial';

  @override
  String get passwordRequirementMatch => 'La confirmation est identique';

  @override
  String get settingsAccountTitle => 'Compte';

  @override
  String get settingsCreateAccountButton => 'Créer un compte';

  @override
  String settingsCreateAccountWith(String supplier) {
    return 'Créer un compte avec $supplier';
  }

  @override
  String get settingsNoAccount => 'Vous n\'êtes actuellement pas connecté, vos réglages et autres données ne sont pas sauvegardées et pourraient être perdus. Appuyez ici pour créer un compte.';

  @override
  String get settingsDeleteTitle => 'Supprimer le compte';

  @override
  String get settingsDeleteCaption => 'Les informations de votre compte, votre profil, ainsi que toutes les données enregegistrées dans l\'app seront supprimées.';

  @override
  String get settingsDeleteButton => 'Supprimer le compte';

  @override
  String get settingsDeleteAlertTitle => 'Supprimer le compte';

  @override
  String get settingsEmailSectionTitle => 'Informations de connexion';

  @override
  String get settingsEmailLabel => 'Adresse e-mail';

  @override
  String get settingsEmailTitle => 'Adresse e-mail';

  @override
  String get settingsEmailPlaceholder => 'Nouvelle adresse e-mail';

  @override
  String get settingsPasswordTitle => 'Mot de passe';

  @override
  String get settingsPasswordLabel => 'Mot de passe';

  @override
  String get settingsPasswordPlaceholder => 'Nouveau mot de passe';

  @override
  String get settingsPasswordConfirmationPlaceholder => 'Confirmez le mot de passe';

  @override
  String get settingsPasswordEdit => 'Modifier';

  @override
  String get settingsPasswordUndefinedCaption => 'Vous n\'avez pas encore défini de mot de passe, vous ne pourrez donc pas vous connecter à votre compte en utilisant votre adresse e-mail et votre mot de passe. Seule la connexion via un compte tiers sera fonctionnelle.';

  @override
  String get settingsThirdPartySectionTitle => 'Connexion via un compte tiers';

  @override
  String get settingsThirdPartyConnected => 'Connecté';

  @override
  String get settingsThirdPartyNotConnected => 'Non connecté';

  @override
  String get settingsThirdPartyCaption => 'Vous pouvez cumuler plusieurs méthodes de connexion afin de sécuriser l\'accès à votre compte.';

  @override
  String get settingsLogoutButton => 'Déconnexion';

  @override
  String get settingsLogoutConfirmation => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get settingsUndefined => 'Non défini';

  @override
  String get signInAnonymously => 'Continuer sans créer de compte';

  @override
  String get signInNoSupplier => 'Aucun fournisseur d\'authentification n\'a été configuré pour cette app.';

  @override
  String signInWith(String supplier) {
    return 'Continuer avec $supplier';
  }

  @override
  String get signInWithEmail => 'un e-mail';

  @override
  String get signInWithEmailLink => 'un e-mail';

  @override
  String get signInWithEmailLinkTitle => 'S\'identifier avec un e-mail';

  @override
  String get signInWithEmailLinkSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailLinkSuccess => 'Vérifiez vos e-mails, nous vous avons envoyé un lien pour vous identifier.';

  @override
  String get signInWithEmailLinkRetry => 'You did not receive it? Try again or try another identification method.';

  @override
  String get signInWithEmailCreateAccount => 'Pas encore inscrit ? Créez un compte.';

  @override
  String get signInWithEmailForgotPassword => 'Mot de passe oublié ?';

  @override
  String get signInWithEmailPlaceholder => 'Adresse e-mail';

  @override
  String get signInWithEmailPasswordPlaceholder => 'Mot de passe';

  @override
  String get signInWithEmailAlreadyAccount => 'Déjà inscrit ? Identifiez-vous ici.';

  @override
  String get signInWithEmailRegisterButton => 'Créer un compte';

  @override
  String get signInWithEmailRegisterTitle => 'S\'inscrire avec un e-mail';

  @override
  String get signInWithEmailTitle => 'S\'identifier avec un e-mail';

  @override
  String get signInWithEmailSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailInvalidPasswordConfirmation => 'Passwords do not match';

  @override
  String get signInWithPhone => 'un numéro';

  @override
  String get signInPhoneTitle => 'Numéro de téléphone';

  @override
  String get signInPhoneSubtitle => 'Nous allons envoyer un SMS pour confirmer votre numéro, cela ne vous coûtera rien.';

  @override
  String signInPhonePlaceholder(String example) {
    return 'Exemple: $example';
  }

  @override
  String get signInPhoneAutoRetrieve => 'Vous n\'aurez peut-être pas besoin de saisir le code car l\'application tentera de le détecter automatiquement.';

  @override
  String get signInPhoneLoadingDialog => 'En attente de la détection automatique du code...';

  @override
  String get signInVerificationTitle => 'Vérification du numéro';

  @override
  String signInVerificationSubtitle(String phoneNumber) {
    return 'Saisissez le code à 6 chiffres que nous avons envoyé au $phoneNumber';
  }

  @override
  String signInVerificationNotReceived(String seconds) {
    return 'Vous n\'avez pas reçu le code ?\nAttendez $seconds secondes...';
  }

  @override
  String get signInVerificationResend => 'Renvoyer le code';

  @override
  String get errorExpiredActionCode => 'Ce lien a expiré.';

  @override
  String get errorInvalidEmail => 'Cette adresse e-mail n\'est pas valide.';

  @override
  String get errorInvalidVerificationCode => 'Code de vérification non valide !';

  @override
  String get errorUserDisabled => 'Ce compte a été désactivé.';

  @override
  String get errorUserNotFound => 'Nous n\'avons trouvé aucun compte enregistré avec cette adresse e-mail.';

  @override
  String get errorWrongPassword => 'Le mot de passe est incorrect.';

  @override
  String get errorEmailAlreadyInUse => 'Un compte existe déjà avec cette adresse e-mail.';

  @override
  String errorCredentialAlreadyInUse(String provider) {
    return 'Un compte est déjà lié à ce compte $provider.';
  }

  @override
  String get errorWeakPassword => 'Le mot de passe n\'est pas assez complexe.';

  @override
  String get errorOperationNotAllowed => 'Cette opération n\'est pas autorisée.';

  @override
  String get errorPhoneNotMobile => 'Vous devez saisir un numéro de téléphone mobile.';

  @override
  String get errorUnknown => 'Une erreur inconnue est survenue.';

  @override
  String get unlinkTitle => 'Que souhaitez-vous faire ?';

  @override
  String unlinkProvider(String provider) {
    return 'Déconnecter $provider';
  }
}
