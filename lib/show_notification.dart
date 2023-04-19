import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShowNotification {
// Initialize FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// Function to show a local notification
  Future<void> showNotification(
      String title, String body, String customData) async {
    // Define the notification details
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '12',
      title,
      channelDescription: body,
      importance: Importance.max,
      priority: Priority.high,
    );
    final platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: null);
    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: customData,
    );
  }

  Future<void> initializeFlutterLocalNotificationsPlugin() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
