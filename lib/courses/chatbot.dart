import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: blue,
        toolbarHeight: 64,
        elevation: 0,
        title: Text(
          'KEYBOX',
          style: GoogleFonts.magra(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/bot.png'),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BubbleSpecialOne(
                      text: 'posez moi une question sur le cours!',
                      color: Color(0xFFE8E8EE),
                      isSender: false,
                      tail: false,
                      textStyle:
                          TextStyle(color: Colors.grey[900], fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MessageBar(
              messageBarHitText: 'Ecrire votre question ici',
              onSend: (_) => print(_),
              sendButtonColor: blue,
              actions: [
                InkWell(
                  child: Icon(
                    Icons.add,
                    color: blue,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
