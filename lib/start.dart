import 'dart:math';

import 'package:app_links/app_links.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stk9/acc.dart';
import 'package:stk9/clrs.dart';
import 'package:stk9/link.dart';
import 'package:stk9/load.dart';
import 'package:stk9/main.dart';
import 'package:stk9/mines.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  static double b = 1000;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkbc();
    checkrst();
  }

  void checkrst() {
    final _appLinks = AppLinks(); // AppLinks is singleton

// Subscribe to all events (initial link and further)
    _appLinks.uriLinkStream.listen((uri) {
      // Do something (navigation, ...)
      if (uri.toString() == 'stk://reset.com') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reset(),
            )).then(
          (value) {
            refres();
          },
        );
      }
    });
  }

  void checkbc() {
    var z = box.get('bc');
    if (z != null) {
      Start.b = double.parse(z);
      setState(() {});
    } else {
      Start.b = 1000;
    }
  }

  void refres() {
    setState(() {});

    box.put('bc', '${Start.b}');
  }

  var tabchnger = 1;

  @override
  Widget build(BuildContext context) {
    var srcheadlist = [
      'https://stakebonus.com/static/uploads/stake-sports.png',
      'https://stakebonus.com/static/uploads/stake-casino.png',
      'https://stakebonus.com/static/uploads/stake-sponsorships.png'
    ];

    var drwlist = ['Loans', 'Policies', 'About', 'Terms of Service'];

    return Scaffold(
      // backgroundColor: c1,
      drawer: Drawer(
          backgroundColor: c2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Stack(children: [
              ListView.builder(
                itemCount: drwlist.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Account(),
                            )),
                        child: ListTile(
                          title: Text(
                            '🪙 ${Start.b}',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Account balance',
                            style:
                                TextStyle(color: Colors.white30, fontSize: 12),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Load(),
                            )),
                        title: Text(
                          drwlist[index - 1],
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
              ),
              Positioned(
                bottom: 0,
                left: 25,
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          c3,
                          c1,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        '@samvabya',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )),
      appBar: AppBar(
        // backgroundColor: c1,
        title: Image.asset(
          'assets/stake-logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: srcheadlist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        color: c3,
                        width: 320,
                        child: Image.network(
                          srcheadlist[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // DefaultTabController(
                //   length: 5,
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       Container(
                //         child: TabBar(
                //             dividerHeight: 0,
                //             indicatorColor: c4,
                //             labelColor: c4,
                //             unselectedLabelColor: Colors.white24,
                //             isScrollable: true,
                //             tabs: [
                //               Tab(text: "Lobby"),
                //               Tab(text: "Live Casinos"),
                //               Tab(text: "Featured Slots"),
                //               Tab(text: "Game Shows"),
                //               Tab(text: "A Stake Originals"),
                //             ]),
                //       ),
                //       Container(
                //         //Add this to give height
                //         height: MediaQuery.of(context).size.height,
                //         child: TabBarView(children: [
                //           Lobby(context),
                //           Container(
                //             child: Image.asset('assets/euupelgrux7d1.gif'),
                //           ),
                //           Container(
                //             child: Image.asset('assets/euupelgrux7d1.gif'),
                //           ),
                //           Container(
                //             child: Image.asset('assets/euupelgrux7d1.gif'),
                //           ),
                //           Container(
                //             child: Image.asset('assets/euupelgrux7d1.gif'),
                //           ),
                //         ]),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                // tbs(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomSlidingSegmentedControl<int>(
                      // clipBehavior: Clip.antiAlias,

                      initialValue: 1,
                      children: {
                        1: Text(
                          'Lobby',
                          style: TextStyle(color: Colors.white54),
                        ),
                        2: Text(
                          'Bets',
                          style: TextStyle(color: Colors.white54),
                        ),
                        3: Text(
                          'Favorites',
                          style: TextStyle(color: Colors.white54),
                        ),
                        4: Text(
                          'Stores',
                          style: TextStyle(color: Colors.white54),
                        ),
                        5: Text(
                          'Loans',
                          style: TextStyle(color: Colors.white54),
                        ),
                        6: Text(
                          'Add-ons',
                          style: TextStyle(color: Colors.white54),
                        ),
                      },
                      decoration: BoxDecoration(
                        color: c2,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: c1,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInToLinear,
                      onValueChanged: (v) {
                        // print(v);
                        setState(() {
                          tabchnger = v;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: tabchnger == 1,
                  child: Lobby(context),
                  replacement: Container(
                    height: MediaQuery.sizeOf(context).height * 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onDoubleTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Account(),
            )),
        onTap: () => refres(),
        child: Container(
          width: double.infinity,
          height: 25,
          color: c3,
          child: Center(
              child: Text(
            '🪙 ${Start.b}',
            style: TextStyle(
              color: Start.b > 0 ? Colors.yellowAccent : Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }

  Widget Lobby(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'A Stake Orignals',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              '● Online',
              style: TextStyle(color: Colors.greenAccent, fontSize: 15),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            children: [
              InkWell(
                  onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mines(),
                          )).then(
                        (value) => refres(),
                      ),
                  child: lobitem(
                    url: 'https://casino.guide/media/mines-logo.jpg',
                    index: 1,
                  )),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Load(),
                      )),
                  child: lobitem(
                      url: 'https://casino.guide/media/dice-stake.jpg')),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Load(),
                      )),
                  child: lobitem(
                      url: 'https://casino.guide/media/limbo-logo.jpg')),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Load(),
                      )),
                  child: lobitem(
                      url: 'https://casino.guide/media/plinko-logo.jpg')),
              lobitem(url: 'https://casino.guide/media/crash-logo.jpg'),
              lobitem(
                  url:
                      'https://mediumrare.imgix.net/59d1df22a2931a965fc241a436a398f460e71ea9d0214f66780a52b56655d392?q=85'),
              lobitem(
                  url:
                      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRkElyyuCopjUxyVA0BRN5sKyPqjC4UmLWEKLNGe9hh1TXvO0qn'),
              lobitem(
                  url:
                      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSUQ_ojtF9fcFqKa298A_8W7gthoMKCcatws396KRWFYv5Xpn_Y'),
              lobitem(
                  url:
                      'https://bc.imgix.net/game/image/cc1d6d33-e97f-4948-8513-13f7fc450157.png?auto=format&dpr=2.625&w=200'),
              lobitem(
                  url:
                      'https://efirbet.com/static/uploads/kazino-igri-provably-fair-wheel.png'),
              lobitem(url: 'https://www.tipminer.com/casinos/stake-slide.png'),
              lobitem(
                  url:
                      'https://crashmoney.games/wp-content/uploads/2023/07/Dragon-Tiger-Logo-e1688559840643-1200x1272.jpeg'),
              lobitem(
                  url:
                      'https://ballislife.com/betting/wp-content/uploads/sites/20/2024/04/Stake.us-Table-Games-Blackjack-2.png'),
              lobitem(
                  url:
                      'https://chipy.com/images_repo/game_logo/214x167/stake_games_hilo.webp'),
              lobitem(
                  url:
                      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbMGbwyUgtxTM1iiVXZfcfpEVcJuu12efl2fda2Rn_Ez2Wk9MD'),
              lobitem(
                  url:
                      'https://bc.imgix.net/game/image/df9765a5-6f57-4db0-afa6-ab2e27562d99.png?auto=format&dpr=2.625&w=200'),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: c4,
          ),
          child: Text('Load more'),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class lobitem extends StatelessWidget {
  final url;
  final index;
  const lobitem({super.key, required this.url, this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: c3,
        // height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '● ${Random().nextInt(1000)}',
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: index == 1,
              child: Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '⫻Trending',
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class tbs extends StatelessWidget {
  const tbs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomSlidingSegmentedControl<int>(
          initialValue: 1,
          children: {
            1: Text(
              'Lobby',
              style: TextStyle(color: Colors.white54),
            ),
            2: Text(
              'Bets',
              style: TextStyle(color: Colors.white54),
            ),
            3: Text(
              'Favorites',
              style: TextStyle(color: Colors.white54),
            ),
            4: Text(
              'Stores',
              style: TextStyle(color: Colors.white54),
            ),
            5: Text(
              'Loans',
              style: TextStyle(color: Colors.white54),
            ),
            6: Text(
              'Add-ons',
              style: TextStyle(color: Colors.white54),
            ),
          },
          decoration: BoxDecoration(
            color: c2,
            borderRadius: BorderRadius.circular(50),
          ),
          thumbDecoration: BoxDecoration(
            color: c1,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: Offset(
                  0.0,
                  2.0,
                ),
              ),
            ],
          ),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInToLinear,
          onValueChanged: (v) {
            // print(v);
          },
        ),
      ),
    );
  }
}
