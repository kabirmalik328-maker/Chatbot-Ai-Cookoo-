import 'package:chat_bot/controller/provider/chatbot_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Builder(
        builder: (context) {
          var provider = context.watch<ChatbotProvider>();

          return Container(
            // color: Color(0xFF06345d),
            decoration: BoxDecoration(
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
                controller: provider.controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Ask Anything...',

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                  ),
                  border: OutlineInputBorder(),

                  suffixIcon: IconButton(
                    onPressed: () {
                      ChatbotProvider p = context.read<ChatbotProvider>();
                      p.sendMessage();
                    },
                    icon: Icon(Icons.send, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),

      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          // image: AssetImage("assets/image/ro.png"),
          // fit: BoxFit.cover,
          // ),
          color: Color(0xFFf6efe4),
        ),

        child: Column(
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 1,
              decoration: BoxDecoration(
                color: Color(0xFF06345d),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.03),

                        child: Icon(Icons.arrow_back, color: Color(0xFFf6efe4)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/image/ro.png'),

                          // backgroundColor: Colors.amber,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // left: size.width * 0.02,
                          // bottom: size.height * 0.01,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                // bottom: size.height * 0.01,
                              ),
                              child: Row(
                                children: [
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

                            Row(
                              children: [
                                Text(
                                  '• ',
                                  style: TextStyle(
                                    fontFamily: 'Poppin',
                                    // color: Color(0xFF3cccf9),
                                    // color: Colors.white,
                                    color: Color(0xFF3eccf9),

                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Available',
                                  style: TextStyle(
                                    fontFamily: 'Poppin',
                                    // color: Color(0xFF3cccf9),
                                    // color: Colors.white,
                                    color: Color(0xFF3eccf9),

                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.40),
                        child: Icon(
                          Icons.more_vert_outlined,
                          color: Color(0xFFf6efe4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<ChatbotProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: size.height * 0.6,
                  child: ListView(
                    padding: EdgeInsets.all(12),
                    children: [
                      if (provider.chatbotResponse != null)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              provider
                                  .chatbotResponse!
                                  .candidates[0]
                                  .content
                                  .parts[0]
                                  .text,
                              style: TextStyle(
                                fontFamily: 'Poppin',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
