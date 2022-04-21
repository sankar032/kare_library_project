import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverDueBooksDetails extends StatefulWidget {
  const OverDueBooksDetails({Key? key}) : super(key: key);

  @override
  State<OverDueBooksDetails> createState() => _OverDueBooksDetailsState();
}

class _OverDueBooksDetailsState extends State<OverDueBooksDetails> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff00988F),
        title: const Text(
          "Over Due Details",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Over Due Book",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "3",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text("S.NO"),
                    ),
                    DataColumn(
                      label: Text("Book No"),
                    ),
                    DataColumn(
                      label: Text("Book Name"),
                    ),
                    DataColumn(
                      label: Text("ID"),
                    ),
                    DataColumn(
                      label: Text("Name"),
                    ),
                    DataColumn(
                      label: Text("Staff of Student"),
                    ),
                    DataColumn(
                      label: Text("Date of Issue"),
                    ),
                    DataColumn(
                      label: Text("Book Return Date"),
                    ),
                    DataColumn(
                      label: Text("Our Due Date"),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(
                          Text("1"),
                        ),
                        DataCell(
                          Text("5012"),
                        ),
                        DataCell(
                          Text("Advance PHP Development"),
                        ),
                        DataCell(
                          Text("9921116017"),
                        ),
                        DataCell(
                          Text("M Sankar"),
                        ),
                        DataCell(
                          Text("MCA"),
                        ),
                        DataCell(
                          Text("11/04/22"),
                        ),
                        DataCell(
                          Text("20/04/22"),
                        ),
                        DataCell(
                          Text("1"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("2"),
                        ),
                        DataCell(
                          Text("5012"),
                        ),
                        DataCell(
                          Text("beginner PHP development"),
                        ),
                        DataCell(
                          Text("9921116017"),
                        ),
                        DataCell(
                          Text("M Sankar"),
                        ),
                        DataCell(
                          Text("MCA"),
                        ),
                        DataCell(
                          Text("11/04/22"),
                        ),
                        DataCell(
                          Text("20/04/22"),
                        ),
                        DataCell(
                          Text("1"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("3"),
                        ),
                        DataCell(
                          Text("4512"),
                        ),
                        DataCell(
                          Text("beginner flutter development"),
                        ),
                        DataCell(
                          Text("JPKMCA"),
                        ),
                        DataCell(
                          Text("J Pradeep"),
                        ),
                        DataCell(
                          Text("STAFF"),
                        ),
                        DataCell(
                          Text("12/04/22"),
                        ),
                        DataCell(
                          Text("20/04/22"),
                        ),
                        DataCell(
                          Text("2"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
