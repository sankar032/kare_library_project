import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Dashboard",
        ),
      ),
      body: SingleChildScrollView(
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
                      children: const [
                        Text(
                          "Total Student",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "105",
                          textAlign: TextAlign.start,
                          style: TextStyle(
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
