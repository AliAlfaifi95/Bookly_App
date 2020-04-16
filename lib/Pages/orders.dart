import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'ORDERS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Order no.')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Total'))
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('0021')),
                      DataCell(Text('14/08/2020')),
                      DataCell(Text('145 SR'),
                      )
                    ])

                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
