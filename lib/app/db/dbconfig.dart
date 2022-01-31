import 'package:http/http.dart' as http;
import 'dart:convert';

class DBaccess {
  var loginapi = Uri.parse('https://www.tnspecial.in/customerapp/login.php');

  Future loginfun(String userid, String password) async {
    var data = {
      'email': userid,
      'password': password,
      'fcm': "sdflsldk;fklsdnfksdjkfbksdbjsbhffggggkjhg",
    };
    var response = await http.post(loginapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }
}
