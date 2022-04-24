import 'package:http/http.dart' as http;
import 'dart:convert';

class DBaccess {
  var loginapi = Uri.parse('http://172.20.11.66/karelib/login.php');
  var staffaddapi = Uri.parse('http://172.20.11.66/karelib/staffadd.php');
  var studentaddapi = Uri.parse('http://172.20.11.66/karelib/studentadd.php');
  var scanbookapi = Uri.parse('http://172.20.11.66/karelib/scanbook.php');
  var outsourebookapi =
      Uri.parse('http://172.20.11.66/karelib/outsourebook.php');

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

  Future studentadd(
    String studentname,
    String regno,
    String classname,
    String joinyear,
    String passedoutyear,
  ) async {
    var data = {
      'studentname': studentname,
      'regno': regno,
      'class': classname,
      'joinyear': joinyear,
      'passedoutyear': passedoutyear,
    };
    var response = await http.post(studentaddapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }

  Future scanbook(String bookno) async {
    var data = {'bookno': bookno};
    var response = await http.post(scanbookapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }

  Future outsourcebook(
    String bookno,
    String studentregno,
    String staffid,
  ) async {
    var data = {
      'bookno': bookno,
      'student_regno': studentregno,
      'staffid': staffid,
    };
    var response = await http.post(outsourebookapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }
}
