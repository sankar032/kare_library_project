import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:karelibrary/app/db/dbconfig.dart';
import 'package:karelibrary/app/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordvissable = false;

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

  Future loginvaild() async {
    loading(context);
    if (email.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "User ID is Must");
    } else if (password.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Failed", "Password is Must");
    } else {
      var data = await DBaccess().loginfun(email.text, password.text);
      Navigator.pop(context);
      if (data["head"]["code"] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        setState(() {
          preferences.setBool("login", true);
          preferences.setString(
              "username", data["body"]["username"].toString());
          preferences.setString("email", data["body"]["email"].toString());
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainApp(),
          ),
        );
      } else {
        alertbox(context, "Failed", data["head"]["msg"].toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "KARE LIBRARY",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sign in to your account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Staff ID",
                            filled: true,
                            fillColor: Color(0xfff1f5f9),
                            prefixIcon: Icon(
                              Iconsax.user,
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
                          controller: password,
                          obscureText: passwordvissable == true ? false : true,
                          onEditingComplete: () {
                            loginvaild();
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xfff1f5f9),
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            suffixIcon: passwordvissable == true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordvissable = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Iconsax.eye,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordvissable = true;
                                      });
                                    },
                                    icon: const Icon(
                                      Iconsax.eye_slash,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            loginvaild();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff00988F),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            width: double.infinity,
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
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
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 15,
                bottom: 15,
              ),
              width: double.infinity,
              //color: Colors.grey.shade100,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "By clicking the button above, you agree to our ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms of Use ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
