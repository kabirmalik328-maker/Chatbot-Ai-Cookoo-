import 'dart:convert';

import 'package:chat_bot/model/chatbot_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ChatbotProvider extends ChangeNotifier {
  List message = [];
  TextEditingController controller = TextEditingController();
  ChatbotModel? chatbotResponse;
  bool isShowbutton = false;
  bool isloading = false;
  isShowloading(bool value) {
    isloading = value;
    notifyListeners();
  }

  isSendButtonVisible() {
    if (controller.text.isEmpty) {
      isShowbutton = false;
    } else {
      isShowbutton = true;
    }
    notifyListeners();
  }

  // void clearResponse()async {
  //     chatbotResponse = null;
  //     notifyListeners();
  //   }

  sendMessage() async {
    isShowloading(true);
    var headers = {
      'Content-Type': 'application/json',
      'X-goog-api-key': 'AIzaSyAxTdXIZ2CGC-fT9zcyW4uBrLrxpFdsR8k',
    };
    final body = json.encode({
      "contents": [
        {
          "parts": [
            {"text": controller.text},
          ],
        },
      ],
    });
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
    );
    var data = await http.post(url, body: body, headers: headers);
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      // print(data.body);
      chatbotResponse = ChatbotModel.fromJson(response);

      message.add(chatbotResponse!.candidates[0].content.parts[0].text);
      controller.clear();
      isSendButtonVisible();
      // clearResponse();
      isShowloading(false);
      notifyListeners();
    }
  }
}
