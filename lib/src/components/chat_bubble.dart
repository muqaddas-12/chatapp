
import 'package:chatapp/src/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({super.key,required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {

    // lightmode vs darkmode for the chat bubble
    bool isDarkMode=Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
        ?(isDarkMode?Colors.green.shade600:Colors.green.shade500)
        :(isDarkMode?Colors.grey.shade800:Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical:2.5,horizontal:20 ),
      child: Text(message,
      style:TextStyle(
        color:isCurrentUser?Colors.white
        :(isDarkMode?Colors.white:Colors.black),
      ),
      ),
    );
  }
}