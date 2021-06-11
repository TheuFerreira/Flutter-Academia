import 'package:flutter/material.dart';
import 'package:flutter_academia/model/day_model.dart';

class TileComponent extends StatelessWidget {
  const TileComponent({Key? key, this.day, this.onTap}) : super(key: key);

  final DayModel? day;
  final void Function(DayModel)? onTap;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new InkWell(
        onTap: () => onTap!(day!),
        child: new Container(
          decoration: new BoxDecoration(
            color: day!.color,
            borderRadius: new BorderRadius.circular(10),
          ),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                new SizedBox(),
                new Text(
                  day!.name!,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                new Text(
                  day!.subName == null ? '' : day!.subName!,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
