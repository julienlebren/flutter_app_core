library notifications;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

@riverpod
Function(String) fcmTokenHandler(FcmTokenHandlerRef ref) =>
    throw UnimplementedError();

@riverpod
Function(RemoteMessage) messageHandler(MessageHandlerRef ref) =>
    throw UnimplementedError();

@riverpod
class NotificationsService extends _$NotificationsService {
  @override
  bool build() => false;

  void register() async {
    try {
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          final fcmTokenHandler = ref.read(fcmTokenHandlerProvider);
          fcmTokenHandler(fcmToken);
        }
        state = true;
      } else {
        state = false;
      }
    } catch (_) {
      state = false;
    }
  }

  void removeBadge() {
    FlutterAppBadger.removeBadge();
  }

  Future<void> setupInteractedMessage() async {
    final messageHandler = ref.read(messageHandlerProvider);
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      messageHandler(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(messageHandler);
  }
}
