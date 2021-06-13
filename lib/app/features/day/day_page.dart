import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/day/components/dropdown_component.dart';
import 'package:flutter_academia/app/features/day/components/save_button_component.dart';
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
  late DayModel day;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DayController>(context, listen: false).getAllTrainings(day);
    });
    super.initState();

    final controller = context.read<DayController>();
    controller.selectedDate = DateTime.now();
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
        actions: [
          IconButton(onPressed: null, icon: Icon(null)),
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 40),
            new Row(
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
            new SizedBox(height: 40),
            new TextDateComponent(),
            new SizedBox(height: 40),
            new SaveButtonComponent(day: day),
            new SizedBox(height: 40),
            new TableComponent(),
          ],
        ),
      ),
    );
  }
}
