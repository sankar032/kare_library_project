import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:karelibrary/app/booksadd.dart';
import 'package:karelibrary/app/db/dbconfig.dart';
import 'package:karelibrary/app/outsidebooks.dart';
import 'package:karelibrary/app/outstandingbook.dart';
import 'package:karelibrary/app/overduedetails.dart';
import 'package:karelibrary/app/staffsadd.dart';
import 'package:karelibrary/app/studentsadd.dart';
import 'package:karelibrary/app/totalbooks.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future myFuture;

  Future getdata() async {
    var data = await DBaccess().dashboardfun();
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
          "Dashboard",
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // DrawerHeader(
            //   decoration: const BoxDecoration(color: Colors.pinkAccent),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: const [
            //       SizedBox(
            //         width: double.infinity,
            //       ),
            //       ListTile(
            //         title: Text(
            //           "M Sankar",
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //         ),
            //         subtitle: Text(
            //           "msankar032@gmail.com",
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff00988F)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://media.istockphoto.com/photos/portrait-concept-picture-id1016761216?k=20&m=1016761216&s=612x612&w=0&h=jEC8voGLjSyhdOO7EMQyrLtZ9m--TEUmd4X56sqyZk0=",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      "M Sankar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "msankar032@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(
                Iconsax.home,
              ),
              title: Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentDetails(),
                  ),
                );
              },
              leading: const Icon(
                Iconsax.user,
              ),
              title: const Text("Student Details"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Booksadd(),
                  ),
                );
              },
              leading: const Icon(
                Iconsax.book,
              ),
              title: const Text("Books Details"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OutStandingBooks(),
                  ),
                );
              },
              leading: const Icon(
                Iconsax.book_1,
              ),
              title: const Text("Out Standing Book"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OverDueBooksDetails(),
                  ),
                );
              },
              leading: const Icon(
                Iconsax.dollar_circle,
              ),
              title: const Text("Over Due Details"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaffAdd(),
                  ),
                );
              },
              leading: const Icon(Iconsax.user_edit),
              title: const Text("Staffs Details"),
            ),
            const Spacer(),
            const ListTile(
              title: Text("Version: 1.0"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Iconsax.logout),
              title: Text("Logout"),
            ),
          ],
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Total Student",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                (snapshot.data as dynamic)["body"]["Totstd"]
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Total Books",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                (snapshot.data as dynamic)["body"]["Totbook"]
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OutsideBooks(),
                        ),
                      );
                    },
                    child: Container(
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
                        children: [
                          const Text(
                            "Out Side Book",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            (snapshot.data as dynamic)["body"]["outsidebook"]
                                .toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
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
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Over Due Book",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          (snapshot.data as dynamic)["body"]["overdue"]
                              .toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TotalBooks(),
                        ),
                      );
                    },
                    child: const Text("View All"),
                  ),
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
