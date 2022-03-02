import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import 'package:sports/Model/feedback_model.dart';

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
      dateList2.add(widget.feedback2[i].total.toString());
    }
    for (var i = 0; i < widget.feedback3.length; i++) {
      dateList3.add(widget.feedback3[i].total.toString());
    }
    print("This is date list $dateList");
  }

  String date = 'Fri 02';
  @override
  void initState() {
    super.initState();
    getDateList();
    //date=  await widget.dateList[0];
  }

  @override
  Widget build(BuildContext context) {
    dateList=dateList.toSet().toList();
    print(dateList);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              title: const Text(
                "BetHero",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: [
                IconButton(
                    onPressed: () {
                      //getFeedbackFromSheet();
                    },
                    icon: Icon(Icons.replay))
              ],
              bottom: PreferredSize(
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Colors.red,
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          // child: Container(
                          //   height: height * .15,
                          //   width: width * .25,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     border: Border.all(color: Colors.black),
                          //     color: Colors.red),
                          //     child: const ListTile(
                          //       title: Icon(Icons.sports_basketball_sharp),
                          //       subtitle: Text("Baseketball",style: TextStyle(color: Colors.white),),
                          //     )
                          // ),
                          text: 'Basketball',
                          icon: Icon(Icons.sports_basketball_outlined),
                        ),
                        Tab(
                          text: 'Hockey',
                          icon: Icon(Icons.sports_hockey_outlined),
                        ),
                        Tab(
                          text: 'Handball',
                          icon: Icon(Icons.sports_handball_outlined),
                        ),
                      ],
                    ),
                    Container(
                      height: height * .05,
                      width: width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListView.builder(
                          itemCount: dateList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => setState(() {
                                date = dateList[index];
                              }),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * .03,
                                    vertical: height * .015),
                                child: Text(dateList[index].toString()),
                              ),
                            );
                          }),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       ListView.builder(
                    //         shrinkWrap: true,
                    //         itemCount: dateList.length,
                    //         itemBuilder: (context,index){
                    //         return Text(dateList[index].toString());
                    //       })
                    //       // Text('02 Feb 22')
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                preferredSize: Size.fromHeight(height * .15),
              )),
          drawer: Drawer(
            child: ListView(
              children: const [Text('Testing Drawer')],
            ),
          ),
          body: TabBarView(children: [
            //This is the First sheet data
            BasketballCard(width, height, date),
            //This is the Seconde sheet data
            FootballCard(width, height, date),
            //This is the third sheet data
            HandballCard(width, height, date),
          ])),
    );
  }

  ListView HandballCard(double width, double height, String date) {
    return ListView.builder(
        itemCount: widget.feedback3.length,
        itemBuilder: (context, index) {
          return date == widget.feedback3[index].date
              ? Padding(
                  padding: EdgeInsets.only(
                      left: width * .04, right: width * .04, top: width * .03),
                  child: GestureDetector(
                    onDoubleTap: () => Navigator.push(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback3[index].away
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                const Text("VS",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback3[index].home
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * .1,
                                  width: width * .28,
                                  child: const ListTile(
                                    title: Text(
                                      'Who will win?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text('Away win',
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
                                    title: const Text('Total Points',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                        widget.feedback3[index].total
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
                                    title: const Text('Final Score',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                        '${widget.feedback3[index].bc_away_score.toString()} : ${widget.feedback3[index].bc_home_score.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
        });
  }

  ListView FootballCard(double width, double height, String date) {
    return ListView.builder(
        itemCount: widget.feedback2.length,
        itemBuilder: (context, index) {
          return date == widget.feedback2[index].date
              ? Padding(
                  padding: EdgeInsets.only(
                      left: width * .04, right: width * .04, top: width * .03),
                  child: GestureDetector(
                    onDoubleTap: () => Navigator.push(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback2[index].away
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                const Text("VS",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback2[index].home
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * .1,
                                  width: width * .28,
                                  child: const ListTile(
                                    title: Text(
                                      'Who will win?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text('Away win',
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
                                    title: const Text('Total Points',
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
                                    title: const Text('Final Score',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                        '${widget.feedback2[index].bc_away_score.toString()} : ${widget.feedback2[index].bc_home_score.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
        });
  }

  ListView BasketballCard(double width, double height, String date) {
    return ListView.builder(
        itemCount: widget.feedback.length,
        itemBuilder: (context, index) {
          return date == widget.feedback[index].date
              ? Padding(
                  padding: EdgeInsets.only(
                      left: width * .04, right: width * .04, top: width * .03),
                  child: GestureDetector(
                    onDoubleTap: () => Navigator.push(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback[index].away
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                const Text("VS",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: height * .16,
                                    width: width * .3,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'Assets/barca.png',
                                          ),
                                          width: width * .25,
                                          height: width * .25,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          widget.feedback[index].home
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * .1,
                                  width: width * .28,
                                  child: const ListTile(
                                    title: Text(
                                      'Who will win?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text('Away win',
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
                                    title: const Text('Total Points',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                        widget.feedback[index].total.toString(),
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
                                    title: const Text('Final Score',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                        '${widget.feedback[index].bc_away_score.toString()} : ${widget.feedback[index].bc_home_score.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
        });
  }
}
