import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:karelibrary/app/db/dbconfig.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController studentname = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController joinyear = TextEditingController();
  TextEditingController passedoutyear = TextEditingController();

  String classname = 'BCA';

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

  Future addstudentfun() async {
    loading(context);
    if (studentname.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Student Name is Must");
    } else if (regno.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Register Number is Must");
    } else if (classname.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Class Name is Must");
    } else if (joinyear.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Join Year is Must");
    } else if (passedoutyear.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Passed Out Year is Must");
    } else {
      var data = await DBaccess().studentadd(studentname.text, regno.text,
          classname, joinyear.text, passedoutyear.text);
      Navigator.pop(context);
      if (data["head"]["code"] == 200) {
        alertbox(context, "Success", "Success To Student Details Added");
      } else {
        alertbox(context, "Failed", data["head"]["msg"]);
      }
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff00988F),
        title: const Text(
          "Student Details",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.document_download,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff00988F),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Upload Excel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Iconsax.document_upload,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Student Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: studentname,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Student Name",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: regno,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Reg No",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<dynamic>(
                          value: classname,
                          onChanged: (value) {
                            setState(() {
                              classname = value.toString();
                            });
                          },
                          items: const <DropdownMenuItem>[
                            DropdownMenuItem(
                              child: Text("BCA"),
                              value: "BCA",
                              enabled: true,
                            ),
                            DropdownMenuItem(
                              child: Text("MCA"),
                              value: "MCA",
                            ),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Class",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: joinyear,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Join Year",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passedoutyear,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Passed Out Year",
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            addstudentfun();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff00988F),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Add Student",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
