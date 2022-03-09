import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import 'package:sports/Model/feedback_model.dart';
import 'package:sports/views/splash.dart';

import 'detail.dart';

class Home extends StatefulWidget {
  List<FeedbackModel> feedback;
  List<FeedbackModel> feedback2;
  List<FeedbackModel> feedback3;
  // List <String> dateList;
  // List <String> dateList2;
  // List <String> dateList3;
  Home({
    Key? key,
    required this.feedback,
    required this.feedback2,
    required this.feedback3,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> dateList = [];
  List<String> dateList2 = [];
  List<String> dateList3 = [];
  Future getDateList() async {
    await widget.feedback;
    await widget.feedback2;
    await widget.feedback3;
    for (var i = 0; i < widget.feedback.length; i++) {
      dateList.add(widget.feedback[i].date.toString());
    }
    for (var i = 0; i < widget.feedback2.length; i++) {
      dateList2.add(widget.feedback2[i].date.toString());
    }
    for (var i = 0; i < widget.feedback3.length; i++) {
      dateList3.add(widget.feedback3[i].date.toString());
    }
    setState(() {});
  }

  List<Tab> tabs = [];
  @override
  void initState() {
    super.initState();
    getDateList();
    getTabs() {
      for (var i = 0; i < dateList.length; i++) {
        tabs.add(Tab(
          text: dateList[i],
        ));
      }
      return tabs;
      setState(() {});
    }
    //date=  await widget.dateList[0];
  }

  @override
  Widget build(BuildContext context) {
    dateList = dateList.toSet().toList();
    dateList2 = dateList2.toSet().toList();
    dateList3 = dateList3.toSet().toList();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Tab> basketballTab = [];
    List<Widget> basketballWidget = [];
    List<Tab> footballTab = [];
    List<Widget> footballWidget = [];
    List<Tab> handballTab = [];
    List<Widget> handballWidget = [];
    for (var item in dateList) {
      basketballTab.add(Tab(
        text: item,
      ));
      basketballWidget.add(BasketballCard(width, height, item));
    }
    for (var item in dateList2) {
      footballTab.add(Tab(
        text: item,
      ));
      footballWidget.add(FootballCard(width, height, item));
    }
    for (var item in dateList3) {
      handballTab.add(Tab(
        text: item,
      ));
      handballWidget.add(HandballCard(width, height, item));
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            leading: Icon(Icons.menu),
              iconTheme: const IconThemeData(color: Colors.black),
              title: const Text(
                "BC Sports Betting",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         //getFeedbackFromSheet();
              //       },
              //       icon: Icon(Icons.replay))
              // ],
              bottom: TabBar(
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'College',
                    icon: Image.asset(
                      "Assets/bball.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ), // Icon(Icons.sports_basketball_outlined),
                  ),
                  Tab(
                    text: 'College Football',
                    icon: Image.asset(
                      "Assets/Helmet.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Tab(
                    text: 'NFL',
                    icon: Image.asset(
                      "Assets/dball.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              )),
              //TODO: Uncomment this when want to add something in drawer
          // drawer: Drawer(
          //   child: ListView(
          //     children: const [
          //       // Text('Testing Drawer')
          //     ],
          //   ),
          // ),
          body: TabBarView(children: [
            //This is the first sheet data
            Basketball(
                basketballTab: basketballTab,
                height: height,
                width: width,
                basketballWidget: basketballWidget),
            //This is the second sheet data
            Football(
                footballTab: footballTab,
                height: height,
                width: width,
                footballWidget: footballWidget),
            //This is the third sheet data
            Handball(
                handballTab: handballTab,
                height: height,
                width: width,
                handballWidget: handballWidget),
          ])),
    );
  }

  ListView HandballCard(double width, double height, String date) {
    return !widget.feedback3.contains(date)
        ? ListView.builder(
            itemCount: widget.feedback3.length,
            itemBuilder: (context, index) {
              return date == widget.feedback3[index].date
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: width * .04,
                          right: width * .04,
                          top: width * .03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                feedback: widget.feedback3,
                                index: index,
                              ),
                            )),
                        child: Card(
                          child: SizedBox(
                            height: height * .3,
                            width: width * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                'Assets/Helmet.png',
                                              ),
                                              width: width * .15,
                                              height: width * .15,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.feedback3[index].away
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                    const Text("at",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                'Assets/dball.png',
                                              ),
                                              width: width * .15,
                                              height: width * .15,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.feedback3[index].home
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: const ListTile(
                                        title: Text(
                                          'Projected Scores',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Icon(
                                          Icons.arrow_upward,
                                          color: Colors.green,
                                        ), /*Text('',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))*/
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Betting Total',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback3[index].total
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Line',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback3[index].home_line
                                                .toString(),
                                            // '${widget.feedback3[index].bc_away_score.toString()} : ${widget.feedback3[index].bc_home_score.toString()}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox();
            })
        : ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * .4),
                child: Center(
                  child: Text("No record available for the date $date"),
                ),
              )
            ],
          );
  }

  ListView FootballCard(double width, double height, String date) {
    print(dateList2);
    print(dateList);
    bool isTrue = false;
    for (var i = 0; i < dateList2.length; i++) {
      if (dateList2[i] == date) {
        setState(() {
          isTrue = true;
        });
      }
      setState(() {
        isTrue = false;
      });
    }
    print(isTrue);
    return !isTrue
        ? ListView.builder(
            itemCount: widget.feedback2.length,
            itemBuilder: (context, index) {
              return date == widget.feedback2[index].date
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: width * .04,
                          right: width * .04,
                          top: width * .03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                feedback: widget.feedback2,
                                index: index,
                              ),
                            )),
                        child: Card(
                          child: SizedBox(
                            height: height * .3,
                            width: width * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                'Assets/Helmet.png',
                                              ),
                                              width: width * .15,
                                              height: width * .15,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.feedback2[index].away
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                    const Text("at",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                'Assets/dball.png',
                                              ),
                                              width: width * .15,
                                              height: width * .15,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.feedback2[index].home
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: const ListTile(
                                        title: Text(
                                          'Projected Scores',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Icon(
                                          Icons.arrow_upward,
                                          color: Colors.green,
                                        ), 
                                        // subtitle: Text('',
                                        //     textAlign: TextAlign.center,
                                        //     style: TextStyle(
                                        //         fontSize: 12,
                                        //         fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Betting Total',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback2[index].total
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Line',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback2[index].home_line
                                                .toString(),
                                            // '${widget.feedback2[index].bc_away_score.toString()} : ${widget.feedback2[index].bc_home_score.toString()}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox();
            })
        : ListView(
            children: [
              Center(
                child: Text("No record available for the date $date"),
              )
            ],
          );
  }

  ListView BasketballCard(double width, double height, String date) {
    return !widget.feedback.contains(date)
        ? ListView.builder(
            itemCount: widget.feedback.length,
            itemBuilder: (context, index) {
              return date == widget.feedback[index].date
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: width * .04,
                          right: width * .04,
                          top: width * .03),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                feedback: widget.feedback,
                                index: index,
                              ),
                            )),
                        child: Card(
                          child: SizedBox(
                            height: height * .3,
                            width: width * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                'Assets/Hoops.png',
                                              ),
                                              width: width * .15,
                                              height: width * .15,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              widget.feedback[index].away
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                    const Text("at",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                        height: height * .16,
                                        width: width * .3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                'Assets/bball.png',
                                              ),
                                              width: width * .15,
                                              height: width * .150,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              widget.feedback[index].home
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: const ListTile(
                                          title: Text(
                                            'Projected Scores?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          subtitle: Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          )),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Betting Total',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback[index].total
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .1,
                                      width: width * .28,
                                      child: ListTile(
                                        title: const Text('Line',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                        subtitle: Text(
                                            widget.feedback[index].home_line
                                                .toString(),
                                            // '${widget.feedback[index].bc_away_score.toString()} : ${widget.feedback[index].bc_home_score.toString()}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox();
            })
        : ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * .4),
                child: Center(
                  child: Text("No record available for the date $date"),
                ),
              )
            ],
          );
  }
}

class Handball extends StatelessWidget {
  const Handball({
    Key? key,
    required this.handballTab,
    required this.height,
    required this.width,
    required this.handballWidget,
  }) : super(key: key);

  final List<Tab> handballTab;
  final double height;
  final double width;
  final List<Widget> handballWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: handballTab.length,
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: PreferredSize(
              child: Container(
                height: height * .05,
                width: width,
                decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.white,
                    tabs: handballTab),
              ),
              preferredSize: Size.fromHeight(height * .05),
            ),
            body: TabBarView(
              children: handballWidget,
            )));
  }
}

class Football extends StatelessWidget {
  const Football({
    Key? key,
    required this.footballTab,
    required this.height,
    required this.width,
    required this.footballWidget,
  }) : super(key: key);

  final List<Tab> footballTab;
  final double height;
  final double width;
  final List<Widget> footballWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: footballTab.length,
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: PreferredSize(
              child: Container(
                height: height * .05,
                width: width,
                decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.white,
                    tabs: footballTab),
              ),
              preferredSize: Size.fromHeight(height * .05),
            ),
            body: TabBarView(
              children: footballWidget,
            )));
  }
}

class Basketball extends StatelessWidget {
  const Basketball({
    Key? key,
    required this.basketballTab,
    required this.height,
    required this.width,
    required this.basketballWidget,
  }) : super(key: key);

  final List<Tab> basketballTab;
  final double height;
  final double width;
  final List<Widget> basketballWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: basketballTab.length,
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: PreferredSize(
              child: Container(
                height: height * .05,
                width: width,
                decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.white,
                    tabs: basketballTab),
              ),
              preferredSize: Size.fromHeight(height * .05),
            ),
            body: TabBarView(
              children: basketballWidget,
            )));
  }
}
