import 'package:http/http.dart' as http;
import 'dart:convert';

class DBaccess {
  var loginapi = Uri.parse('http://172.20.11.66/karelib/login.php');

  var staffaddapi = Uri.parse('http://172.20.11.66/karelib/staffadd.php');

  Future loginfun(String userid, String password) async {
    var data = {'staffid': userid, 'password': password};
    var response = await http.post(loginapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }

  Future staffadd(String staffname, String userid, String staffemail,
      String password) async {
    var data = {
      'staffname': userid,
      'staffid': userid,
      'email': staffemail,
      'password': password,
    };
    var response = await http.post(staffaddapi, body: json.encode(data));

    var message = jsonDecode(response.body);
    return message;
  }
}
