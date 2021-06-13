import 'package:flutter/material.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      backgroundColor: Colors.transparent,
      child: new Container(
        height: 200,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15),
        ),
        child: new Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(10),
              child: new Container(
                height: 120,
                child: new Center(
                  child: new Text(
                    message,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new SizedBox(
                  width: 100,
                  child: new ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text(
                      'Não',
                      style: new TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                new SizedBox(width: 25),
                new SizedBox(
                  width: 100,
                  child: new ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: new Text(
                      'Sim',
                      style: new TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
