import 'package:flutter/material.dart';
import 'package:stk9/main.dart';
import 'package:stk9/start.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    claiming();
  }

  void claiming() {
    Start.b = 1000;
    box.put('bc', '1000');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            shadowColor: Colors.green.shade700,
            elevation: 11,
            color: Colors.green.shade700,
            margin: EdgeInsets.all(70),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    '🪙 1000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'You have successfully reseted your account XXXX. Good luck on your betting journey!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.green.shade100,
                      // fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
