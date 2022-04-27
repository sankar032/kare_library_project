import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class OutStandingBooks extends StatefulWidget {
  const OutStandingBooks({Key? key}) : super(key: key);

  @override
  State<OutStandingBooks> createState() => _OutStandingBooksState();
}

class _OutStandingBooksState extends State<OutStandingBooks> {
  TextEditingController bookname = TextEditingController();
  TextEditingController bookno = TextEditingController();
  TextEditingController bookrowno = TextEditingController();
  TextEditingController studentregno = TextEditingController();
  TextEditingController staffid = TextEditingController();

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

  Future addoutsourcebookdetails() async {
    loading(context);
    if (bookno.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Book Details is Must");
    } else {}
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
          "Out Standing Details",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    var result = await BarcodeScanner.scan();

                    bookno.text = result.toString();
                  },
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
                          "Scan Book",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Iconsax.scan,
                          color: Colors.white,
                        )
                      ],
                    ),
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
                    "Book Details",
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
                          controller: bookname,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Book Name",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: bookno,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Book No",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: bookrowno,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Book Row No",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: studentregno,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Student Reg No",
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      var result = await BarcodeScanner.scan();

                                      studentregno.text = result.toString();
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: const Icon(
                                        Iconsax.scan,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: staffid,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Staff Id",
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      var result = await BarcodeScanner.scan();
                                      staffid.text = result.toString();
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: const Icon(
                                        Iconsax.scan,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            addoutsourcebookdetails();
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
                                "Add Book",
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
