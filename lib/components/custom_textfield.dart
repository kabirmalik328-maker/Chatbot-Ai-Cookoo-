import 'package:chat_bot/controller/provider/chatbot_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ChatbotProvider>(
      builder: (context, provider, child) {
        return Container(
          height: size.height * 0.16,
          width: size.width * 100,
          decoration: const BoxDecoration(
            color: Color(0xFF06345d),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
              top: size.height * 0.04,
              bottom: size.height * 0.04,
            ),
            child: TextField(
              onChanged: (text) {
                provider.isSendButtonVisible();
              },
              controller: provider.controller,
              onSubmitted: (text) {
                if (!provider.isloading) {
                  provider.sendMessage();
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Ask Anything...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue, width: 3),
                ),
                border: const OutlineInputBorder(),
                suffixIcon: provider.isShowbutton
                    ? provider.isloading
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF06345d),
                                ),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                provider.sendMessage();
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Color(0xFF06345d),
                              ),
                            )
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
