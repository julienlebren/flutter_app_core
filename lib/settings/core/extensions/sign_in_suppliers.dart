part of settings;

extension SignInSupplierSettings on SignInSupplier {
  SettingsAccountEvent? get settingsAccountEvent {
    switch (this) {
      case Supplier.google:
        return const SettingsAccountEvent.signInWithGoogle();
      case Supplier.apple:
        return const SettingsAccountEvent.signInWithApple();
      default:
        return null;
    }
  }
}
