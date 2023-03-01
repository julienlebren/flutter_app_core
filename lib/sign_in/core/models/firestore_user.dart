part of sign_in;

@freezed
class FirestoreUser with _$FirestoreUser {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory FirestoreUser({
    String? id,
    String? displayName,
    String? emailAddress,
    @Default(false) bool emailVerified,
    @Default(false) bool hasPassword,
    @Default(false) bool needInfo,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
