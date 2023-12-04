import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuvEJ53CU1jnGWoWlpKxFVYEVZTSoK79U",
            authDomain: "jeeping-8403c.firebaseapp.com",
            projectId: "jeeping-8403c",
            storageBucket: "jeeping-8403c.appspot.com",
            messagingSenderId: "22487835426",
            appId: "1:22487835426:web:6b29083554b41880053b7b"));
  } else {
    await Firebase.initializeApp();
  }
}
