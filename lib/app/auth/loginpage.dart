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
  bool passwordvissable = false;
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();

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

  Future<void> loginvalid() async {
    FocusScope.of(context).requestFocus(FocusNode());
    loading(context);
    if (userid.text.isEmpty && password.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Waring", "Plese Fill the Details");
    } else if (userid.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Waring", "User ID was Empty");
    } else if (password.text.isEmpty) {
      Navigator.pop(context);
      alertbox(context, "Waring", "Password was Empty");
    } else {
      var message = await DBaccess().loginfun(userid.text, password.text);
      Navigator.pop(context);
      if (message["head"]["code"] == 200) {
        var _prs = await SharedPreferences.getInstance();
        _prs.setBool('login', true);
        _prs.setString('user_id', message["body"]["user_id"].toString());
        _prs.setString('fcmid', message["body"]["fcm_id"].toString());
        _prs.setString('name', message["body"]["name"].toString());
        _prs.setString('phone', message["body"]["telephone"].toString());
        _prs.setString('email', message["body"]["email"].toString());
        _prs.setString('address', message["body"]["address"].toString());
        _prs.setString('pincode', message["body"]["pincode"].toString());
        _prs.setString('city', message["body"]["city"].toString());
        _prs.setString('state', message["body"]["state"].toString());
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainApp(),
          ),
        );
      } else {
        alertbox(context, "Login Faild", message["head"]["msg"]);
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "KARE Library Management",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome back!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
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
                            controller: userid,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Email Address",
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
                            height: 20,
                          ),
                          TextFormField(
                            controller: password,
                            obscureText:
                                passwordvissable == true ? false : true,
                            decoration: InputDecoration(
                              fillColor: const Color(0xfff1f5f9),
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Iconsax.key,
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
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              //loginvalid();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainApp(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.pinkAccent,
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
            ],
          ),
        ),
      ),
    );
  }
}
