import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatBotPanel extends StatelessWidget {
  const ChatBotPanel({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.facebookMessenger,
            ),
            onPressed: () {
              // Add logic to open the chat here
            },
          ),
        ],
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    _handleSubmitted(_textController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleSubmitted(String userMessage) {
    // User message
    _addMessage(ChatMessage(userMessage, true));

    // Bot response
    _addMessage(ChatMessage(_getBotResponse(userMessage), false));

    _textController.clear();
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  String _getBotResponse(String userMessage) {
    // Replace this with your own logic to generate bot responses
    return 'Bot: Thank you for saying "$userMessage". I am a simple bot.';
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage(this.text, this.isUser) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) // Display user icon for bot messages
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200],
              child: FaIcon(FontAwesomeIcons.robot, color: Colors.green),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
