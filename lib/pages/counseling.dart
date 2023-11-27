import 'package:flutter/material.dart';
import 'package:istaff/utils/constants.dart';

class CounselingSession extends StatefulWidget {
  @override
  _CounselingSessionState createState() => _CounselingSessionState();
}

class _CounselingSessionState extends State<CounselingSession> {
  TextEditingController _messageController = TextEditingController();
  List<String> _chatMessages = [];

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _chatMessages.add("User: $message");
        // You can add logic here to handle responses from a counselor or chatbot
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counseling Session'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_chatMessages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}