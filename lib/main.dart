import 'package:flutter/material.dart';
import 'package:sports/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:sports/views/splash.dart';
import 'dart:convert' as convert;

import 'Model/feedback_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // UserSheetApi.init();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // // ignore: deprecated_member_use
  // //All the data of first sheet is stored in the feedbacks variable
  // List<FeedbackModel> feedbacks = <FeedbackModel>[];
  // //All the data of second sheet is stored in the feedbacks2 variable
  // List<FeedbackModel> feedbacks2 = <FeedbackModel>[];
  // //All the data of second sheet is stored in the feedbacks3 variable
  // List<FeedbackModel> feedbacks3 = <FeedbackModel>[];
  //   List<String>? dateList ;

  // Future getFeedbackFromSheet() async {
  //   //This is the first Sheet
  //   var raw = await http.get(Uri.parse(
  //       "https://script.google.com/macros/s/AKfycby0dTZBvFz_23p4kFkL5Wlzzp6uWzKAK1xhej3nhoEjg95XDWYm-kc_N58-RayO-pc/exec"));
  //   var jsonFeedback = convert.jsonDecode(raw.body);
  //   print('this is json Feedback $jsonFeedback');
    

  //   // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

  //   jsonFeedback.forEach((element) {
  //     print('$element THIS IS NEXT>>>>>>>');
  //     FeedbackModel feedbackModel = FeedbackModel();
  //     feedbackModel.away = element['away'];
  //     feedbackModel.home = element['home'];
  //     feedbackModel.home_line = element['home_line'].toString();
  //     feedbackModel.total = element['total'].toString();
  //     feedbackModel.bc_away_score = element["bc_away_score"].toString();
  //     feedbackModel.bc_home_score = element['bc_home_score'].toString();
  //     feedbackModel.bc_total_score = element['bc_total_sc'].toString();
  //     feedbackModel.guest_away_score = element["guest_away_score"].toString();
  //     feedbackModel.guest_home_score = element['guest_home_score'].toString();
  //     feedbackModel.guest_total_score = element['guest_total_sc'].toString();
  //     feedbackModel.kp_away_score = element["kp_away_score"].toString();
  //     feedbackModel.kp_home_score = element['kp_home_score'].toString();
  //     feedbackModel.kp_total_score = element['kp_total_score'].toString();
  //     feedbackModel.avg_total = element['avg_total'].toString();

  //     feedbacks.add(feedbackModel);
  //   });
  //   //This is second sheet
  //   var raw2 = await http.get(Uri.parse(
  //       "https://script.google.com/macros/s/AKfycbwKxzD3Z0B0ndZlCdpbGwE6l41AM3qUR1Uy6AhXv_OIH67XgxkaAeFA76zZy6HeLsAf/exec"));
  //   var jsonFeedback2 = convert.jsonDecode(raw2.body);
  //   print('this is json Feedback $jsonFeedback2');

  //   // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

  //   jsonFeedback2.forEach((element2) {
  //     print('$element2 THIS IS NEXT>>>>>>>');
  //     FeedbackModel feedbackModel2 = FeedbackModel();
  //     feedbackModel2.away = element2['away'];
  //     feedbackModel2.home = element2['home'];
  //     feedbackModel2.home_line = element2['home_line'].toString();
  //     feedbackModel2.total = element2['total'].toString();
  //     feedbackModel2.bc_away_score = element2["bc_away_score"].toString();
  //     feedbackModel2.bc_home_score = element2['bc_home_score'].toString();
  //     feedbackModel2.bc_total_score = element2['bc_total_sc'].toString();
  //     feedbackModel2.guest_away_score = element2["guest_away_score"].toString();
  //     feedbackModel2.guest_home_score = element2['guest_home_score'].toString();
  //     feedbackModel2.guest_total_score = element2['guest_total_sc'].toString();
  //     feedbackModel2.kp_away_score = element2["kp_away_score"].toString();
  //     feedbackModel2.kp_home_score = element2['kp_home_score'].toString();
  //     feedbackModel2.kp_total_score = element2['kp_total_score'].toString();
  //     feedbackModel2.avg_total = element2['avg_total'].toString();

  //     feedbacks2.add(feedbackModel2);
  //   });
  //   //This is second sheet
  //   var raw3 = await http.get(Uri.parse(
  //       "https://script.google.com/macros/s/AKfycbwXTUMxBC_-zR-ao7E9uXJ768_X7cSmaYlecCX7buG-fJ81qnWJRtclgU_wS1B6zGh2/exec"));
  //   var jsonFeedback3 = convert.jsonDecode(raw3.body);
  //   print('this is json Feedback $jsonFeedback3');

  //   // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

  //   jsonFeedback3.forEach((element3) {
  //     print('$element3 THIS IS NEXT>>>>>>>');
  //     FeedbackModel feedbackModel3 = FeedbackModel();
  //     feedbackModel3.away = element3['away'];
  //     feedbackModel3.home = element3['home'];
  //     feedbackModel3.home_line = element3['home_line'].toString();
  //     feedbackModel3.total = element3['total'].toString();
  //     feedbackModel3.bc_away_score = element3["bc_away_score"].toString();
  //     feedbackModel3.bc_home_score = element3['bc_home_score'].toString();
  //     feedbackModel3.bc_total_score = element3['bc_total_sc'].toString();
  //     feedbackModel3.guest_away_score = element3["guest_away_score"].toString();
  //     feedbackModel3.guest_home_score = element3['guest_home_score'].toString();
  //     feedbackModel3.guest_total_score = element3['guest_total_sc'].toString();
  //     feedbackModel3.kp_away_score = element3["kp_away_score"].toString();
  //     feedbackModel3.kp_home_score = element3['kp_home_score'].toString();
  //     feedbackModel3.kp_total_score = element3['kp_total_score'].toString();
  //     feedbackModel3.avg_total = element3['avg_total'].toString();

  //     feedbacks3.add(feedbackModel3);
  //   });
  //   //print('${feedbacks[0]}');
  // }
  

  // @override
  // void initState() {
  //   getFeedbackFromSheet();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Bet Sports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
