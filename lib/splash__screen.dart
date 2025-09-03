import 'dart:async';
import 'package:chat_bot/view/chatbot_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_bot/controller/provider/chatbot_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ChatbotScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06345d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/image/ro.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Cöökóò',
              style: TextStyle(
                fontFamily: 'Poppin',
                // color: Color(0xFF3cccf9),
                // color: Colors.white,
                color: Color(0xFFf6efe4),

                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
