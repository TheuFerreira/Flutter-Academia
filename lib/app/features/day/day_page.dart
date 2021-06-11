import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/day/components/dropdown_component.dart';
import 'package:flutter_academia/app/features/day/components/table_component.dart';
import 'package:flutter_academia/app/features/day/components/text_date_component.dart';
import 'package:flutter_academia/app/features/day/day_controller.dart';
import 'package:flutter_academia/app/features/home/models/day_model.dart';
import 'package:provider/provider.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late DateTime selectedDate = DateTime.now();
  late DayModel day;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DayController>(context, listen: false).getAllTrainings(day);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments;
    DayModel dayModel = result as DayModel;
    day = dayModel;

    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(day.name!),
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
                  new DropdownComponent(),
                ],
              ),
            ),
            new TextDateComponent(onPressed: () async => await changeDate()),
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
            new TableComponent(),
          ],
        ),
      ),
    );
  }

  Future<void> changeDate() async {
    DayController dayController = context.read<DayController>();
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
    context.read<DayController>().save(day);
  }
}
