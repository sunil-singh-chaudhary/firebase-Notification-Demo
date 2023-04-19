import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TITLE'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Subscribe to Push Notifications'),
          onPressed: () async {
            FirebaseMessaging messaging = FirebaseMessaging.instance;
            NotificationSettings settings = await messaging.requestPermission(
              alert: true,
              badge: true,
              sound: true,
            );
            print('User granted permission: ${settings.authorizationStatus}');
          },
        ),
      ),
    );
  }
}
