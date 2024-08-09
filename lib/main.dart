import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stk9/clrs.dart';
import 'package:stk9/start.dart';

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('box');


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: c1,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c2,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c1,
        iconTheme: IconThemeData(
          color: Colors.white60,
        ),
      ),
    ),
    home: Flashh(),
  ));
}

class Flashh extends StatefulWidget {
  const Flashh({super.key});

  @override
  State<Flashh> createState() => _FlashhState();
}

class _FlashhState extends State<Flashh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Start(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Image.asset('assets/euupelgrux7d1.gif')),
      ),
    );
  }
}
