import 'package:flutter/material.dart';
import 'package:flutter_academia/controller/day_controller.dart';
import 'package:flutter_academia/controller/home_controller.dart';
import 'package:flutter_academia/view/day_page.dart';
import 'package:flutter_academia/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
      providers: [
        new ChangeNotifierProvider<HomeController>.value(
            value: new HomeController()),
        new ChangeNotifierProvider<DayController>.value(
            value: new DayController()),
      ],
      child: new MaterialApp(
        title: 'Academia',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => new HomePage(),
          '/day': (context) => new DayPage(),
        },
      ),
    );
  }
}
