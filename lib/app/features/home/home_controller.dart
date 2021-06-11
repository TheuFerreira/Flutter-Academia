import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academia/model/DAO/dao_day.dart';
import 'package:flutter_academia/app/features/home/models/day_model.dart';

class HomeController extends ChangeNotifier {
  List<DayModel> days = [];
  DAODay _daoDay = new DAODay();

  void getAllDays() async {
    days = await _daoDay.getAllDays();
    notifyListeners();
  }
}
