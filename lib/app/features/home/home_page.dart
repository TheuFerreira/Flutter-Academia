import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/home/home_controller.dart';
import 'package:flutter_academia/model/connection.dart';
import 'package:flutter_academia/app/features/home/components/tile_component.dart';
import 'package:flutter_academia/model/day_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

    context.read<HomeController>().getAllDays();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: new Scaffold(
        body: Consumer<HomeController>(
          builder: (context, homeController, widget) {
            return new StaggeredGridView.count(
              primary: false,
              crossAxisCount: 4,
              staggeredTiles: const <StaggeredTile>[
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(2, 1.75),
                StaggeredTile.count(4, 1.20),
              ],
              children: homeController.days.map((e) {
                return new TileComponent(
                  day: e,
                  onTap: _onTap,
                );
              }).toList(),
            );
          },
        ),
      ),
      onWillPop: () async {
        Connection.db.close = true;
        return true;
      },
    );
  }

  void _onTap(DayModel dayModel) async {
    await Navigator.pushNamed(context, '/day', arguments: dayModel);

    context.read<HomeController>().getAllDays();
  }
}
