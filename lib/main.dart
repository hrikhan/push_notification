import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/api/firebase_notification.dart';
import 'package:push_notification/firebase_options.dart';
import 'package:push_notification/homepage.dart';
import 'package:push_notification/notification.dart';
final nvigatorkey =GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  await  FirebaseNotification().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pushed Notification',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      navigatorKey:  nvigatorkey,
      home: const Homepage(),
      routes: {
        '/notification':(context) => Notificationpage()
      },
    );
  }
}

