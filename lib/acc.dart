import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:stk9/clrs.dart';
import 'package:stk9/main.dart';
import 'package:stk9/start.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkinit();
  }

  Future<void> checkinit() async {
    var z = box.get('bank');
    if (z != null) {
      selectbank = int.parse(z);
      setState(() {});
    } else {
      selectbank = -1;
    }

    if (box.get('sw') != null) {
      sw = bool.parse(box.get('sw'));
      setState(() {});
    }
  }

  var banklist = [
    'State Bank of India',
    'HDFC Bank',
    'Bank of Baroda',
    'Punjab National Bank',
    'Axis Bank'
  ];
  var imgbanklist = [
    'https://zerocreativity0.files.wordpress.com/2016/02/sbi-logo-zero-creativity.jpg?w=736',
    'https://w7.pngwing.com/pngs/636/81/png-transparent-hdfc-thumbnail-bank-logos.png',
    'https://i.pinimg.com/originals/64/19/09/641909d6f37f5523a915b48a0a74a10c.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOI4FaM2MMnDk1UbN0fsacHcypzTZHL69ftQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIRWpyZgno-E67xcXrg0DqkO3z09GXbL0iOw&s'
  ];
  var selectbank = -1;
  bool sw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Restarter.c1,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Restarter.c1,
          surfaceTintColor: Restarter.c1,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.shortestSide),
                  child: Column(
                    children: [
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    color: Restarter.c2,
                                    child: ListView.builder(
                                      itemCount: banklist.length,
                                      itemBuilder: (context, index) => ListTile(
                                        onTap: () async {
                                          setState(() {
                                            selectbank = index;
                                          });
                                          box.put('bank', '$selectbank');

                                          Navigator.pop(context);
                                        },
                                        title: Text(
                                          banklist[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        leading:
                                            Image.network(imgbanklist[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                color: Restarter.c3,
                                child: Center(
                                    child: Stack(
                                  children: [
                                    selectbank == -1
                                        ? SizedBox()
                                        : Image.network(
                                            imgbanklist[selectbank]),
                                    Center(
                                      child: Text(
                                        selectbank == -1
                                            ? 'Add bank'
                                            : banklist[selectbank],
                                        style: TextStyle(
                                          color: selectbank == -1
                                              ? Colors.blueGrey.shade600
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 32 / 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: Restarter.c2,
                                    child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '🪙 ${Start.b}',
                                              style: TextStyle(
                                                color: Start.b > 0
                                                    ? Colors.yellowAccent
                                                    : Colors.redAccent,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Betcoins',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 10,
                                                // fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              AspectRatio(
                                aspectRatio: 32 / 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () async {
                                      HapticFeedback.heavyImpact();
                                      sw = !sw;

                                      box.put('sw', '$sw');
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              action: SnackBarAction(
                                                textColor: Restarter.c4,
                                                label: 'RESTART',
                                                onPressed: () {
                                                  Restarter.restartapp(context);
                                                  // Navigator.pop(context);
                                                  // Navigator.pushReplacement(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           Flashh(),
                                                  //     ));
                                                },
                                              ),
                                              content:
                                                  Text('Restart the app!')));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: sw
                                              ? LinearGradient(colors: [
                                                  Restarter.c4,
                                                  Colors.green,
                                                ])
                                              : LinearGradient(colors: [
                                                  Restarter.c3,
                                                  Restarter.c2
                                                ])),
                                      child: Center(
                                          child: Text(
                                        'Amoled Theme',
                                        style: TextStyle(
                                            color: sw
                                                ? Colors.white
                                                : Restarter.c4),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Your XP seems to be very low! Play bets to unlock Loans.')));
                              },
                              child: Container(
                                color: Colors.white10,
                                child: Center(
                                    child: Text(
                                  'Buy Loans',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Feature not available right now!')));
                              },
                              child: Container(
                                color: Restarter.c3,
                                child: Center(
                                    child: Text(
                                  'Buy Coins',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AspectRatio(
                        aspectRatio: 8 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Start.b < 0
                                ? Color(0x30ff0000)
                                : Color(0x30ffff00),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  Start.b < 0
                                      ? 'You are on credit! Play bets to recover cash or purchase loans from below section, or you can reset your play balance (Trial)'
                                      : 'Tap to claim your one time start bonus of 🪙1000 and start your betting journey!',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Amoled theme feature is currently experimental!',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 10,
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   width: 50,
                      //   child: Card(
                      //     color: Restarter.c1,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      //   width: 50,
                      //   child: Card(
                      //     color: Restarter.c2,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      //   width: 50,
                      //   child: Card(
                      //     color: Restarter.c3,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
