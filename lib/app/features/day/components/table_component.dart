import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../day_controller.dart';

class TableComponent extends StatelessWidget {
  const TableComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DayController>();

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
      rows: controller.allTrainings.map((e) {
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
  }
}
