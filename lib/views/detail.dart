import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.feedback, required this.index})
      : super(key: key);
  var feedback;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Bettor Sports Data",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(image: AssetImage("Assets/App Logo.jpg")),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          DataTable(columns: const [
            DataColumn(
                label: Text(
              'Away',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            DataColumn(label: Text('Home',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
            DataColumn(label: Text('Line',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
            DataColumn(label: Text('Total',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),))
          ], rows: [
            DataRow(cells: [
              DataCell(Text(feedback[index].away.toString(),style: const TextStyle(fontWeight: FontWeight.w500),),),
              DataCell(Text(feedback[index].home.toString(),style: const TextStyle(fontWeight: FontWeight.w500))),
              DataCell(Text(feedback[index].home_line.toString(),style: const TextStyle(color: Colors.red))),
              DataCell(Text(feedback[index].total.toString(),style: const TextStyle(color: Colors.red))),
            ])
          ]),
          const SizedBox(
            height: 50,
          ),
          DataTable(columns: const [
            DataColumn(label: Text('Analysis 👇🏽',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            DataColumn(label: Text('Away',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            DataColumn(label: Text('Home',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          ], rows: [
            DataRow(cells: [
              const DataCell(Text('@BC Computer')),
              DataCell(Text(feedback[index].bc_away_score.toString(),style: const TextStyle(color: Colors.red))),
              DataCell(Text(feedback[index].bc_home_score.toString(),style: const TextStyle(color: Colors.red))),
            ]),
            DataRow(cells: [
              const DataCell(Text('Guest Analysis')),
              DataCell(Text(feedback[index].guest_away_score.toString(),style: const TextStyle(color: Colors.red))),
              DataCell(Text(feedback[index].guest_home_score.toString(),style: const TextStyle(color: Colors.red))),
            ]),
            DataRow(cells: [
              const DataCell(Text('KP Advanced Metrics')),
              DataCell(Text(feedback[index].kp_away_score.toString(),style: const TextStyle(color: Colors.red))),
              DataCell(Text(feedback[index].kp_home_score.toString(),style: const TextStyle(color: Colors.red))),
            ]),
            DataRow(cells: [
              const DataCell(Text('Game Total')),
              const DataCell(Text('👉🏾👉🏾👉🏾')),
              DataCell(Text(feedback[index].avg_total.toString(),style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w500))),
            ])
          ]),
        ],
      ),
    );
  }
}
