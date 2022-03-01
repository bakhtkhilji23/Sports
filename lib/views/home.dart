import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:sports/Model/feedback_model.dart';

import 'detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  //All the data of first sheet is stored in the feedbacks variable
  List<FeedbackModel> feedbacks = <FeedbackModel>[];
  //All the data of second sheet is stored in the feedbacks2 variable
  List<FeedbackModel> feedbacks2 = <FeedbackModel>[];
  //All the data of second sheet is stored in the feedbacks3 variable
  List<FeedbackModel> feedbacks3 = <FeedbackModel>[];

  getFeedbackFromSheet() async {
    //This is the first Sheet
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycby0dTZBvFz_23p4kFkL5Wlzzp6uWzKAK1xhej3nhoEjg95XDWYm-kc_N58-RayO-pc/exec"));
    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel = FeedbackModel();
      feedbackModel.away = element['away'];
      feedbackModel.home = element['home'];
      feedbackModel.home_line = element['home_line'].toString();
      feedbackModel.total = element['total'].toString();
      feedbackModel.bc_away_score = element["bc_away_score"].toString();
      feedbackModel.bc_home_score = element['bc_home_score'].toString();
      feedbackModel.bc_total_score = element['bc_total_sc'].toString();
      feedbackModel.guest_away_score = element["guest_away_score"].toString();
      feedbackModel.guest_home_score = element['guest_home_score'].toString();
      feedbackModel.guest_total_score = element['guest_total_sc'].toString();
      feedbackModel.kp_away_score = element["kp_away_score"].toString();
      feedbackModel.kp_home_score = element['kp_home_score'].toString();
      feedbackModel.kp_total_score = element['kp_total_score'].toString();
      feedbackModel.avg_total = element['avg_total'].toString();

      feedbacks.add(feedbackModel);
    });
    //This is second sheet
    var raw2 = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbwKxzD3Z0B0ndZlCdpbGwE6l41AM3qUR1Uy6AhXv_OIH67XgxkaAeFA76zZy6HeLsAf/exec"));
    var jsonFeedback2 = convert.jsonDecode(raw2.body);
    print('this is json Feedback $jsonFeedback2');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback2.forEach((element2) {
      print('$element2 THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel2 = FeedbackModel();
      feedbackModel2.away = element2['away'];
      feedbackModel2.home = element2['home'];
      feedbackModel2.home_line = element2['home_line'].toString();
      feedbackModel2.total = element2['total'].toString();
      feedbackModel2.bc_away_score = element2["bc_away_score"].toString();
      feedbackModel2.bc_home_score = element2['bc_home_score'].toString();
      feedbackModel2.bc_total_score = element2['bc_total_sc'].toString();
      feedbackModel2.guest_away_score = element2["guest_away_score"].toString();
      feedbackModel2.guest_home_score = element2['guest_home_score'].toString();
      feedbackModel2.guest_total_score = element2['guest_total_sc'].toString();
      feedbackModel2.kp_away_score = element2["kp_away_score"].toString();
      feedbackModel2.kp_home_score = element2['kp_home_score'].toString();
      feedbackModel2.kp_total_score = element2['kp_total_score'].toString();
      feedbackModel2.avg_total = element2['avg_total'].toString();

      feedbacks2.add(feedbackModel2);
    });
    //This is second sheet
    var raw3 = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbwXTUMxBC_-zR-ao7E9uXJ768_X7cSmaYlecCX7buG-fJ81qnWJRtclgU_wS1B6zGh2/exec"));
    var jsonFeedback3 = convert.jsonDecode(raw3.body);
    print('this is json Feedback $jsonFeedback3');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback3.forEach((element3) {
      print('$element3 THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel3 = FeedbackModel();
      feedbackModel3.away = element3['away'];
      feedbackModel3.home = element3['home'];
      feedbackModel3.home_line = element3['home_line'].toString();
      feedbackModel3.total = element3['total'].toString();
      feedbackModel3.bc_away_score = element3["bc_away_score"].toString();
      feedbackModel3.bc_home_score = element3['bc_home_score'].toString();
      feedbackModel3.bc_total_score = element3['bc_total_sc'].toString();
      feedbackModel3.guest_away_score = element3["guest_away_score"].toString();
      feedbackModel3.guest_home_score = element3['guest_home_score'].toString();
      feedbackModel3.guest_total_score = element3['guest_total_sc'].toString();
      feedbackModel3.kp_away_score = element3["kp_away_score"].toString();
      feedbackModel3.kp_home_score = element3['kp_home_score'].toString();
      feedbackModel3.kp_total_score = element3['kp_total_score'].toString();
      feedbackModel3.avg_total = element3['avg_total'].toString();

      feedbacks3.add(feedbackModel3);
    });
    //print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                IconButton(onPressed: (){
                  getFeedbackFromSheet();
                }, icon: Icon(Icons.replay))
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => {},
                            child: Text('02 Mar 22')),
                          Text('03 Mar 22'),
                          Text('04 Mar 22'),
                          Text('05 Mar 22'),
                          // Text('02 Feb 22')
                        ],
                      ),
                    )
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
            feedbacks == null
                ? Center(
                    child: Text('No Data to show'),
                  )
                : ListView.builder(
                    itemCount: feedbacks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: width * .04,
                            right: width * .04,
                            top: width * .03),
                        child: GestureDetector(
                          onDoubleTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  feedback: feedbacks,
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
                                                feedbacks[index]
                                                    .away
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                feedbacks[index]
                                                    .home
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                              feedbacks[index].total.toString(),
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
                                              '${feedbacks[index].bc_away_score.toString()} : ${feedbacks[index].bc_home_score.toString()}',
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
                      );
                    }),
            //This is the Seconde sheet data
            feedbacks2 == null
                ? Center(
                    child: Text('No Data to show'),
                  )
                : ListView.builder(
                    itemCount: feedbacks2.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: width * .04,
                            right: width * .04,
                            top: width * .03),
                        child: GestureDetector(
                          onDoubleTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  feedback: feedbacks2,
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
                                                feedbacks2[index]
                                                    .away
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                feedbacks2[index]
                                                    .home
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                              feedbacks2[index]
                                                  .total
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
                                              '${feedbacks2[index].bc_away_score.toString()} : ${feedbacks2[index].bc_home_score.toString()}',
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
                      );
                    }),
            //This is the third sheet data
            feedbacks3 == null
                ? Center(
                    child: Text('No Data to show'),
                  )
                : ListView.builder(
                    itemCount: feedbacks3.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: width * .04,
                            right: width * .04,
                            top: width * .03),
                        child: GestureDetector(
                          onDoubleTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  feedback: feedbacks3,
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
                                                feedbacks3[index]
                                                    .away
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                feedbacks3[index]
                                                    .home
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                              feedbacks3[index]
                                                  .total
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
                                              '${feedbacks3[index].bc_away_score.toString()} : ${feedbacks3[index].bc_home_score.toString()}',
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
                      );
                    }),
          ])),
    );
  }
}
