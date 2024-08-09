import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stk9/clrs.dart';
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

  var xp = '⭐';
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
  bool sw = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  '🪙 ${Start.b}',
                  style: TextStyle(
                    color: Start.b > 0 ? Colors.yellowAccent : Colors.redAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'XP $xp',
                  style: TextStyle(
                    color: c4,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Visibility(
                      visible: Start.b == 1000,
                      child: ListTile(
                        onTap: () {
                          HapticFeedback.heavyImpact();
                        },
                        isThreeLine: true,

                        tileColor: Color(0x60ffff00),
                        title: Text(
                          'Start Bonus',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Text(
                          'Tap to claim your one time start bonus of 🪙1000 and start your betting journey!',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        // leading: Icon(
                        //   Icons.money,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    Visibility(
                      visible: Start.b < 0,
                      child: ListTile(
                        onTap: () {
                          HapticFeedback.heavyImpact();
                        },
                        isThreeLine: true,

                        tileColor: Color(0x60ff0000),
                        title: Text(
                          'On Credit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Text(
                          'You are on credit! Play bets to recover cash or purchase loans from below section, or you can reset your play balance (Trial)',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        // leading: Icon(
                        //   Icons.money,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      tileColor: c2,
                      title: Text(
                        'Auto-Trial mode',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      trailing: Switch(
                        // splashRadius: 200,

                        activeColor: c4,
                        inactiveTrackColor: c2,
                        value: sw,
                        onChanged: (value) async {
                          HapticFeedback.heavyImpact();
                          setState(() {
                            sw = value;
                            box.put('sw', '$value');
                          });
                        },
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            color: c2,
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
                                      color: Colors.white, fontSize: 20),
                                ),
                                leading: Image.network(imgbanklist[index]),
                              ),
                            ),
                          ),
                        );
                      },
                      tileColor: c2,
                      title: Text(
                        selectbank == -1 ? 'Add bank' : banklist[selectbank],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: selectbank == -1
                          ? Icon(
                              Icons.account_balance,
                              color: Colors.white,
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                  child:
                                      Image.network(imgbanklist[selectbank])),
                            ),
                    ),
                    ListTile(
                      onTap: () {},
                      tileColor: c2,
                      title: Text(
                        'Withdraw from bank',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      leading: Icon(
                        Icons.file_download_done,
                        color: Colors.white70,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Your XP seems to be very low! Play bets to unlock Loans.')));
                      },
                      tileColor: c2,
                      title: Text(
                        'Loans',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      tileColor: c2,
                      title: Text(
                        'Export',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.download_for_offline_outlined,
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      tileColor: c2,
                      title: Text(
                        'Import',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.import_export,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
