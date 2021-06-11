import 'package:flutter/material.dart';

class DayModel {
  int? id;
  Color? color;
  String? name;
  String? subName;

  DayModel({this.id, this.color, this.name, this.subName});

  DayModel.fromJson(Map<String, Object?> map) {
    id = map['id'] as int;
    name = map['nome'] as String;
    color = Color(map['cor'] as int);
    subName = map['sub_name'] as String?;
  }
}
