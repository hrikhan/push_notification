import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: Center(
        child: message == null
            ? const Text("No data")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message.notification?.title ?? "No Title",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 10),
                  Text(message.notification?.body ?? "No Body"),
                ],
              ),
      ),
    );
  }
}
