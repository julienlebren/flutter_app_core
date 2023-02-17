part of settings;

extension SignInSupplierSettings on SignInSupplier {
  SettingsAccountEvent? get settingsAccountEvent {
    switch (this) {
      case SignInSupplier.google:
        return const SettingsAccountEvent.signInWithGoogle();
      case SignInSupplier.apple:
        return const SettingsAccountEvent.signInWithApple();
      default:
        return null;
    }
  }
}
