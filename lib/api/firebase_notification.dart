import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:push_notification/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotification {


 AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // same as in manifest
  'High Importance Notifications',
  importance: Importance.high,
);
 
//create an instance



final _firebasemassage = FirebaseMessaging.instance;

//function of initilizing notification


Future<void> initNotification() async {

  _firebasemassage.requestPermission();

  //permission from user
  final fOMtoken = await _firebasemassage.getToken();
  


  //fatch the fom token for the device

   print('token :$fOMtoken');


  //print       
   
}



//funtion of handle notificaition


void handleMassage(RemoteMessage ? handleMassage){

 if (handleMassage == null) return;
 
nvigatorkey.currentState?.pushNamed(
  '/notification',
  arguments: handleMassage
);
 
}


//funtion of handle forgournd and background

Future initpushedNotification () async{

  //iff terminated
  FirebaseMessaging.instance.getInitialMessage().then(handleMassage);

  FirebaseMessaging.onMessageOpenedApp.listen(handleMassage);

   

}


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Background message received: ${message.messageId}');
}


}