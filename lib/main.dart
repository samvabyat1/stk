import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:stk9/clrs.dart';
import 'package:stk9/start.dart';

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('box');

  runApp(Restarter(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Restarter.c1,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Restarter.c2,
        ),
        appBarTheme: AppBarTheme(
          // backgroundColor: Restarter.c1,
          iconTheme: IconThemeData(
            color: Colors.white60,
          ),
        ),
      ),
      home: Flashh(),
    ),
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
      backgroundColor: Color(0xff1a2c38),
      body: Container(
        child: Center(child: Image.asset('assets/euupelgrux7d1.gif')),
      ),
    );
  }
}

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a2c38),
      body: Container(
        child: Center(child: Image.asset('assets/euupelgrux7d1.gif')),
      ),
    );
  }
}

class Restarter extends StatefulWidget {
  const Restarter({required this.child});
  final Widget child;

  static void restartapp(BuildContext context) {
    context.findAncestorStateOfType<_RestarterState>()!.restartapp();
  }

  static var c1 = Color(0xff1a2c38);
  static var c2 = Color(0xff0f212d);
  static var c3 = Color(0xff213744);
  static var c4 = Color(0xff94F3E4);

  @override
  State<Restarter> createState() => _RestarterState();
}

class _RestarterState extends State<Restarter> {
  Key key = UniqueKey();
  void restartapp() {
    setState(() {
      key = UniqueKey();
    });

    changecol();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changecol();
  }

  void changecol() {
    Restarter.c1 = callf() ? Colors.black : Color(0xff1a2c38);
    Restarter.c2 = callf() ? Colors.black : Color(0xff0f212d);
    Restarter.c3 = callf() ? Colors.white24 : Color(0xff213744);
  }

  bool callf() {
    var sw = false;
    if (box.get('sw') != null) {
      sw = bool.parse(box.get('sw'));
    }
    return sw;
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      child: widget.child,
      key: key,
    );
  }
}
