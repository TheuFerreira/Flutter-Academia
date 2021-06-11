import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/day/day_controller.dart';
import 'package:flutter_academia/app/features/home/home_controller.dart';
import 'package:flutter_academia/app/features/day/day_page.dart';
import 'package:flutter_academia/app/features/home/home_page.dart';
import 'package:provider/provider.dart';

class WidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => DayController()),
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
