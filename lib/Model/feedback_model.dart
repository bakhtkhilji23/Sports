import 'dart:convert';

class FeedbackModel {
  String? away;
  String? home;
  String? home_line;
  String? total;
  String? bc_away_score;
  String? bc_home_score;
  String? bc_total_score;
  String? guest_away_score;
  String? guest_home_score;
  String? guest_total_score;
  String? kp_away_score;
  String? kp_home_score;
  String? kp_total_score;
  String? avg_total;
  String? date;

  FeedbackModel(
      {this.away,
      this.home,
      this.home_line,
      this.total,
      this.bc_away_score,
      this.bc_home_score,
      this.bc_total_score,
      this.guest_away_score,
      this.guest_home_score,
      this.guest_total_score,
      this.kp_away_score,
      this.kp_home_score,
      this.kp_total_score,
      this.avg_total,
      this.date});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      away: jsonDecode(json['away']),
      home: jsonDecode(json['home']),
      home_line: jsonDecode(json['home_line']),
      total: jsonDecode(json['total']),
      bc_away_score: jsonDecode(json['bc_away_score']),
      bc_home_score: jsonDecode(json['bc_home_score']),
      bc_total_score: jsonDecode(json['bc_total_sc']),
      guest_away_score: jsonDecode(json['guest_away_score']),
      guest_home_score: jsonDecode(json['guest_home_score']),
      guest_total_score: jsonDecode(json['guest_total_sc']),
      kp_away_score: jsonDecode(json['kp_away_score']),
      kp_home_score: jsonDecode(json['kp_home_score']),
      kp_total_score: jsonDecode(json['kp_total_sc']),
      avg_total: jsonDecode(json['avg_total']),
      date: jsonDecode(json['date']),
    );
  }

  Map toJson() => {
        "away": away,
        "home": home,
        "home_line": home_line,
        "total": total,
        "bc_away_score": bc_away_score,
        "bc_home_score": bc_home_score,
        "bc_total_sc": bc_total_score,
        "guest_away_score": guest_away_score,
        "guest_home_score": guest_home_score,
        "guest_total_sc": guest_total_score,
        "kp_away_score": kp_away_score,
        "kp_home_score": kp_home_score,
        "kp_total_sc": kp_total_score,
        "avg_total": avg_total,
        "date": date,
      };
}
