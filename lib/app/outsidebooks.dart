import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class OutsideBooks extends StatefulWidget {
  const OutsideBooks({Key? key}) : super(key: key);

  @override
  State<OutsideBooks> createState() => _OutsideBooksState();
}

class _OutsideBooksState extends State<OutsideBooks> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
      body: SingleChildScrollView(
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
                      onTap: () => _selectDate(context),
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
                      onTap: () => _selectDate(context),
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
                      onChanged: (value) {},
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "All",
                          ),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Out Side Book",
                          ),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Over Due Books",
                          ),
                          value: "1",
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
                    DataColumn(
                      label: Text("Actions"),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(
                          Text("1"),
                        ),
                        const DataCell(
                          Text("5012"),
                        ),
                        const DataCell(
                          Text("Advance PHP Development"),
                        ),
                        const DataCell(
                          Text("9921116017"),
                        ),
                        const DataCell(
                          Text("M Sankar"),
                        ),
                        const DataCell(
                          Text("MCA"),
                        ),
                        const DataCell(
                          Text("11/04/22"),
                        ),
                        const DataCell(
                          Text("20/04/22"),
                        ),
                        const DataCell(
                          Text(
                            "1",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Recived"),
                          ),
                        ),
                      ],
                    ),
                    const DataRow(
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
                          Text(
                            "1",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(),
                        ),
                      ],
                    ),
                    const DataRow(
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
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(),
                        ),
                      ],
                    ),
                    const DataRow(
                      cells: [
                        DataCell(
                          Text("4"),
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
                          Text("21/04/22"),
                        ),
                        DataCell(
                          Text("27/04/22"),
                        ),
                        DataCell(
                          Text("0"),
                        ),
                        DataCell(
                          SizedBox(),
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
