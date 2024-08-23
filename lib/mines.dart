import 'dart:async';
import 'dart:math';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stk9/main.dart';
// import 'package:stk9/clrs.dart';
import 'package:stk9/start.dart';

class Mines extends StatefulWidget {
  // final cnt, blx;
  Mines({super.key});

  @override
  State<Mines> createState() => _MinesState();
}

class _MinesState extends State<Mines> {
  List<int> rand(int count) {
    List<int> fe = List.filled(25, 1);
    List<int> nn = [];
    while (nn.length < count) {
      var c = Random().nextInt(25);
      if (nn.contains(c) == false) {
        fe[c] = 0;
        nn.add(c);
      }
    }
    return fe;
  }

  List<int> mat = [];
  var clr = List.filled(25, Restarter.c3);
  int mincon = 8;
  var mx = 8;
  var bx = 100.0;
  bool end = false;
  int draw = 0;
  // var bb = 100.0;
  TextEditingController tx =
      TextEditingController.fromValue(TextEditingValue(text: '0'));

  @override
  void initState() {
    // TODO: implement initState

    mat = rand(mx);
    tx.value = TextEditingValue(text: '$bx');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (draw == 1) {
          Start.b += bx;
          Start.b = double.parse(Start.b.toStringAsFixed(2));
        }
      },
      child: Scaffold(
        backgroundColor: Restarter.c2,
        body: SafeArea(
          child: Center(
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.shortestSide - 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Press back button to cash-out.',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Restarter.c3,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bet amt.',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: 200,
                                      height: 30,
                                      child: TextField(
                                        controller: tx,
                                        onChanged: (value) {
                                          // setState(() {
                                          //   bx = double.parse(value);
                                          // });
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Restarter.c2,
                                            hintText: 'Amount',
                                            hintStyle: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                            border: OutlineInputBorder()),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        // bx = bx / 2;

                                        tx.value = TextEditingValue(
                                            text:
                                                '${double.parse(tx.value.text) / 2}');
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '½',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        // bx = bx * 2;

                                        tx.value = TextEditingValue(
                                            text:
                                                '${double.parse(tx.value.text) * 2}');
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '2x',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Mines',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 30,
                                child: OutlinedButton(
                                  onPressed: () => showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      height: 250,
                                      child: CupertinoPicker(
                                          itemExtent: 30,
                                          scrollController:
                                              FixedExtentScrollController(
                                                  initialItem: 7),
                                          onSelectedItemChanged: (value) {
                                            setState(() {
                                              mincon = value + 1;
                                            });
                                          },
                                          children: List.generate(
                                            24,
                                            (index) => Container(
                                                color: Colors.black,
                                                width: double.infinity,
                                                child: Center(
                                                  child: Text(
                                                    '${index + 1}',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.greenAccent),
                                                  ),
                                                )),
                                          )),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Restarter.c2,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: Center(child: Text('$mincon x')),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    draw = 0;
                                    bx = double.parse(tx.value.text);
                                    mx = mincon;
                                    mat = rand(mx);
                                    clr = List.filled(25, Restarter.c3);
                                    end = false;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Restarter.c2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: Text('Bet'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '🪙$bx , $mx x ',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.shortestSide - 40,
                  decoration: BoxDecoration(
                      color: Restarter.c2,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: GridView.builder(
                      itemCount: 25,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if (clr[index] == Restarter.c3 && end == false) {
                                setState(() {
                                  clr[index] = mat[index] == 1
                                      ? Colors.cyan
                                      : Colors.red;
                                  print(mat);
                                });
                                if (draw == 0) {
                                  Start.b -= bx;
                                  draw = 1;
                                }
                                if (mat[index] == 0) {
                                  bx -= bx * 0.01 * mx * mx;
                                  bx = double.parse(bx.toStringAsFixed(2));
                                  end = true;
                                  for (var i = 0; i < 25; i++) {
                                    if (mat[i] == 0) {
                                      clr[i] = Colors.red;
                                    }
                                  }
                                  setState(() {});
                                  HapticFeedback.vibrate();
                                  HapticFeedback.vibrate();
                                  HapticFeedback.vibrate();
                                  Timer(
                                    Duration(seconds: 1),
                                    () => showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Restarter.c2,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                          color: Colors.green,
                                        )),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Bet output ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '🪙 $bx',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  HapticFeedback.mediumImpact();
                                  setState(() {
                                    bx += bx * 0.01 * mx;
                                    bx = double.parse(bx.toStringAsFixed(2));
                                  });
                                }
                              }
                            },
                            child: Visibility(
                                visible: clr[index] == Restarter.c3,
                                replacement: clr[index] == Colors.red
                                    ? bomb()
                                    : diamond(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Restarter.c3,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget diamond() {
    return Container(
      child: Icon(
        Icons.diamond,
        color: Colors.green,
        size: 40,
        shadows: [
          Shadow(
            color: Colors.green,
            blurRadius: 5,
          )
        ],
      ),
    );
  }

  Widget bomb() {
    return Container(
      child: Icon(
        Icons.cancel,
        color: Colors.red,
        size: 40,
        shadows: [
          Shadow(
            color: Colors.red,
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
