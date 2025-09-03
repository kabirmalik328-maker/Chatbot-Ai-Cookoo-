import 'package:chat_bot/controller/provider/chatbot_provider.dart';
import 'package:chat_bot/splash__screen.dart';
import 'package:chat_bot/view/chatbot_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatbotProvider()),
      ],
      child: MaterialApp(
        // home: ChatbotScreen(),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
