import 'package:flutter/material.dart';

class User {
  List<Result>? result;

  User({required this.result});

  User.jsonData({required Map<String, dynamic> json}) {
    debugPrint("inside the jsonData");

    User(
      result:
          (json['results'] as List<dynamic>)
              .map((e) => Result.fromJson(e))
              .toList(),
    );
  }
}

class Result {
  String? gender;
  Result({required this.gender});

  factory Result.fromJson(Map<String, dynamic> json) {
    debugPrint("inside the getnder");
    debugPrint('${json['gender']}');
    return Result(gender: json['gender']);
  }

  Map<String, dynamic> toJson() {
    return {"gender": gender};
  }
}
