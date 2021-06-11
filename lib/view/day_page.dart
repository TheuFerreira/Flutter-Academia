import 'package:flutter/material.dart';
import 'package:flutter_academia/controller/day_controller.dart';
import 'package:flutter_academia/model/day_model.dart';
import 'package:flutter_academia/model/training_model.dart';
import 'package:flutter_academia/view/components/tile_component.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late DateTime selectedDate = DateTime.now();
  DayModel? day;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DayController>(context, listen: false).getAllTrainings(day!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments;
    TileComponent tileComponent = result as TileComponent;
    day = tileComponent.day;

    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(tileComponent.day!.name!),
        ),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    'Treino do Dia: ',
                    style: new TextStyle(fontSize: 20),
                  ),
                  new SizedBox(width: 10),
                  new Consumer<DayController>(
                      builder: (builder, dayController, widget) {
                    return new DropdownButton<TrainingModel>(
                      value: dayController.selectedTraining,
                      onChanged: dayController.changeSelectedTraining,
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      items: dayController.trainings
                          .map<DropdownMenuItem<TrainingModel>>(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: new Text(e.name!),
                            ),
                          )
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Consumer<DayController>(
                    builder: (builder, dayController, widget) {
                  String date = new DateFormat("dd/MM/yyyy")
                      .format(dayController.selectedDate);
                  return new Text(
                    'Data: $date',
                    style: new TextStyle(fontSize: 20),
                  );
                }),
                new IconButton(
                  onPressed: changeDate,
                  icon: new Icon(Icons.edit),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(20),
              child: new TextButton.icon(
                onPressed: _save,
                icon: new Icon(Icons.save),
                label: new Text(
                  'Salvar',
                  style: new TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: new Size(250, 40),
                ),
              ),
            ),
            new Consumer<DayController>(
              builder: (builder, dayController, widget) {
                return new DataTable(
                  showBottomBorder: true,
                  columns: <DataColumn>[
                    new DataColumn(
                      label: new Text(
                        'Treino',
                        style: new TextStyle(fontSize: 20),
                      ),
                    ),
                    new DataColumn(
                      label: new Text(
                        'Data',
                        style: new TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                  rows: dayController.allTrainings.map((e) {
                    return new DataRow(
                      cells: <DataCell>[
                        new DataCell(
                          new Text(
                            e.training!.name!,
                            style: new TextStyle(fontSize: 18),
                          ),
                        ),
                        new DataCell(
                          new Text(
                            new DateFormat("dd/MM/yyyy").format(e.date!),
                            style: new TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeDate() async {
    DayController dayController =
        Provider.of<DayController>(context, listen: false);
    var result = await showDialog(
      context: context,
      builder: (builder) {
        return new Dialog(
          backgroundColor: Colors.transparent,
          child: new DatePickerDialog(
            initialDate: dayController.selectedDate,
            firstDate: new DateTime(2000, 01, 01),
            lastDate: new DateTime(2050, 01, 01),
          ),
        );
      },
    );
    if (result == null) return;

    DateTime _ = DateTime.parse(result.toString());
    dayController.changeDate(_);
  }

  void _save() async {
    DayController dayController =
        Provider.of<DayController>(context, listen: false);
    dayController.save(day!);
  }
}
