import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/home/home_controller.dart';
import 'package:flutter_academia/model/connection.dart';
import 'package:flutter_academia/app/features/home/components/tile_component.dart';
import 'package:flutter_academia/app/features/home/models/day_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final controller = context.read<HomeController>();
    controller.addListener(() {
      controller.getAllDays();
    });

    controller.getAllDays();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return new WillPopScope(
      child: new Scaffold(
        body: new Padding(
          padding: const EdgeInsets.only(top: 25),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Flexible(
                flex: 3,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Expanded(
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[0],
                              onTap: _onTap,
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[1],
                              onTap: _onTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Flexible(
                flex: 3,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Expanded(
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[2],
                              onTap: _onTap,
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[3],
                              onTap: _onTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Flexible(
                flex: 3,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Expanded(
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[4],
                              onTap: _onTap,
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[5],
                              onTap: _onTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Flexible(
                flex: 2,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Expanded(
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          new Expanded(
                            flex: 1,
                            child: new TileComponent(
                              day: controller.days[6],
                              onTap: _onTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Connection.db.close = true;
        return true;
      },
    );
  }

  void _onTap(DayModel dayModel) async =>
      await Navigator.pushNamed(context, '/day', arguments: dayModel);
}
