part of sign_in;

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.saving() = _Saving;
  const factory SettingsState.error(String errorText) = _Error;
  const factory SettingsState.success() = _Success;
}
