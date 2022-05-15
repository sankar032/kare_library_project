import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:karelibrary/app/db/dbconfig.dart';

class OutsideBooks extends StatefulWidget {
  final int catid;
  const OutsideBooks({Key? key, required this.catid}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<OutsideBooks> createState() => _OutsideBooksState(catid: catid);
}

class _OutsideBooksState extends State<OutsideBooks> {
  late int catid;
  _OutsideBooksState({required this.catid});

  TextEditingController sdate = TextEditingController();
  TextEditingController edate = TextEditingController();

  Future loading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Future alertbox(BuildContext context, String _title, String _error) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_error),
        );
      },
    );
  }

  late Future myFuture;

  receivedbookfun(String trid) async {
    loading(context);
    var data = await DBaccess().returnbookfun(trid, "0");
    Navigator.pop(context);
    if (data["head"]["code"] == 200) {
      alertbox(context, "Success", "Data was Stored");
    } else {
      alertbox(context, "Failed", data["head"]["msg"]);
    }
  }

  Future getreportbooks(String sdate, String edate, String cat) async {
    var data = await DBaccess().reportfun(sdate, edate, cat);
    return data;
  }

  @override
  void initState() {
    myFuture = getreportbooks("", "", catid.toString());
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
          "Report Details",
        ),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Filter Options",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());

                              DateTime? date = DateTime(1900);
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              setState(() {
                                var outputFormat = DateFormat('yyyy-MM-dd');
                                var outputDate = outputFormat.format(date!);
                                sdate.text = outputDate;
                              });
                            },
                            readOnly: true,
                            controller: sdate,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Starting Date",
                              filled: true,
                              fillColor: Color(0xfff1f5f9),
                              prefixIcon: Icon(
                                Iconsax.calendar_1,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());

                              DateTime? date = DateTime(1900);
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              setState(() {
                                var outputFormat = DateFormat('yyyy-MM-dd');
                                var outputDate = outputFormat.format(date!);
                                edate.text = outputDate;
                              });
                            },
                            readOnly: true,
                            controller: edate,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Ending Date",
                              filled: true,
                              fillColor: Color(0xfff1f5f9),
                              prefixIcon: Icon(
                                Iconsax.calendar_1,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField(
                            value: catid,
                            onChanged: (dynamic value) {
                              setState(() {
                                catid = value;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                child: Text(
                                  "All",
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Out Side Book",
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Over Due Books",
                                ),
                                value: 2,
                              ),
                            ],
                            decoration: const InputDecoration(
                              hintText: "Category",
                              filled: true,
                              fillColor: Color(0xfff1f5f9),
                              prefixIcon: Icon(
                                Iconsax.category,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                myFuture = getreportbooks(
                                    sdate.text, edate.text, catid.toString());
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xff00988F),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Search Report",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (snapshot.data as dynamic)["head"]["code"] == 200 &&
                          (snapshot.data as dynamic)["body"].length >= 1
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
                                  label: Text("Actions"),
                                ),
                              ],
                              rows: [
                                for (var item
                                    in (snapshot.data as dynamic)["body"])
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text((item["sno"] + 1).toString()),
                                      ),
                                      DataCell(
                                        Text(item["book_no"].toString()),
                                      ),
                                      DataCell(
                                        Text(item["book_name"].toString()),
                                      ),
                                      DataCell(
                                        Text(
                                          item["student_regno"].toString() +
                                              item["staffid"].toString(),
                                        ),
                                      ),
                                      DataCell(
                                        Text(item["name"].toString()),
                                      ),
                                      DataCell(
                                        Text(item["class"].toString()),
                                      ),
                                      DataCell(
                                        Text(item["book_out_source_date"]
                                            .toString()),
                                      ),
                                      DataCell(
                                        Text(item["book_return_date"]
                                            .toString()),
                                      ),
                                      DataCell(
                                        ElevatedButton(
                                          onPressed: () {
                                            receivedbookfun(
                                                item["tr_id"].toString());
                                          },
                                          child: const Text("Recived"),
                                        ),
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
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return Center(
              child: Text("Someting went Worng" + snapshot.error.toString()),
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
