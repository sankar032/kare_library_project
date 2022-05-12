import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'db/dbconfig.dart';

class TotalBooks extends StatefulWidget {
  const TotalBooks({Key? key}) : super(key: key);

  @override
  State<TotalBooks> createState() => _TotalBooksState();
}

class _TotalBooksState extends State<TotalBooks> {
  late Future myFuture;

  Future getdata() async {
    var data = await DBaccess().totbookfun();
    return data;
  }

  @override
  void initState() {
    myFuture = getdata();
    super.initState();
  }

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
          "Books Details",
        ),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  (snapshot.data as dynamic)["body"]["book"].length > 0
                      ? Container(
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
                              ],
                              rows: [
                                for (var item in (snapshot.data
                                    as dynamic)["body"]["book"])
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(item["sno"].toString()),
                                      ),
                                      DataCell(
                                        Text(item["bookno"].toString()),
                                      ),
                                      DataCell(
                                        Text(item["bookname"].toString()),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
