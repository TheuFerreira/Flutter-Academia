import 'package:flutter/foundation.dart';
import 'package:flutter_academia/model/DAO/dao_dayTraining.dart';
import 'package:flutter_academia/model/DAO/dao_training.dart';
import 'package:flutter_academia/model/dayTraining_model.dart';
import 'package:flutter_academia/model/day_model.dart';
import 'package:flutter_academia/model/training_model.dart';

class DayController extends ChangeNotifier {
  List<TrainingModel> trainings = [];
  List<DayTrainingModel> allTrainings = [];
  TrainingModel? selectedTraining;
  DAOTraining _daoTraining = new DAOTraining();
  DAODayTraining _daoDayTraining = new DAODayTraining();
  DateTime selectedDate = DateTime.now();

  void getAllTrainings(DayModel day) async {
    trainings = await _daoTraining.getAllTraining();
    selectedTraining = trainings[0];

    allTrainings = await _daoDayTraining.getAllOfDay(day);

    notifyListeners();
  }

  void changeSelectedTraining(TrainingModel? trainingModel) {
    selectedTraining = trainingModel!;
    notifyListeners();
  }

  void changeDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void save(DayModel day) async {
    DayTrainingModel dayTraining = new DayTrainingModel(
      date: selectedDate,
      day: day,
      training: selectedTraining,
    );
    await _daoDayTraining.insert(dayTraining);

    getAllTrainings(day);

    selectedTraining = trainings[0];
    selectedDate = DateTime.now();
    print("Salvando");
    notifyListeners();
  }
}
