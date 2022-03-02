import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sports/Model/feedback_model.dart';
import 'package:sports/views/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  // ignore: deprecated_member_use
  //All the data of first sheet is stored in the feedbacks variable
  List<FeedbackModel> feedbacks = <FeedbackModel>[];
  //All the data of second sheet is stored in the feedbacks2 variable
  List<FeedbackModel> feedbacks2 = <FeedbackModel>[];
  //All the data of second sheet is stored in the feedbacks3 variable
  List<FeedbackModel> feedbacks3 = <FeedbackModel>[];
  // List<String> dateList = [];
  // List<String> dateList2 = [];
  // List<String> dateList3 = [];

  Future getBasketballSheetData() async {
    //This is the first Sheet
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyshg5OginqxUZLePJ9_IdDi36tpxqElgKf4F0c-Wb51-VYK7qo5vd5ERniYMwcN_M/exec"));
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
      feedbackModel.date = element['date'].toString();
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
    //print('${feedbacks[0]}');
  }

  Future getFootballSheetData() async {
    //This is second sheet
    var raw2 = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbzSffHPsim0_s2dyzoZ3BdCxsTvXEpMlhxlc7si5ZszQDZ1QopfYaN3KQdCvO2m-KF1/exec"));
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
      feedbackModel2.date = element2['date'].toString();
      feedbacks2.add(feedbackModel2);
    });
    return feedbacks2;
  }

  Future getHandballSheetData() async {
    //This is second sheet
    var raw3 = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbydbvEbu18iv9akkoHKjW6bJSKvX_7zlVS3UcL9fis3tl2sTifvPf90_7STdZASH24/exec"));
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
      feedbackModel3.date = element3['date'].toString();

      feedbacks3.add(feedbackModel3);
    });
    setState(() {
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    getBasketballSheetData();
    getFootballSheetData();
    getHandballSheetData();
  }

  startTimer() async {
    var duration = Duration(seconds: 15);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  feedback: feedbacks,
                  feedback2: feedbacks2,
                  feedback3: feedbacks3,
                )));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.sports),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Loading data ",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
