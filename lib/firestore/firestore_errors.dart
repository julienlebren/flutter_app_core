part of firestore_service;

extension FirestoreExceptionDescription on FirebaseException {
  String description() {
    switch (code) {
      case "unavailable":
        return "unavailable";
      default:
        return "erreur inconnue";
    }
  }
}
