import 'package:http/http.dart' as http;
import 'dart:convert';

class DBaccess {
  var loginapi = Uri.parse('https://karelib.000webhostapp.com/login.php');
  var staffaddapi = Uri.parse('https://karelib.000webhostapp.com/staffadd.php');
  var studentaddapi =
      Uri.parse('https://karelib.000webhostapp.com/studentadd.php');
  var bookaddapi = Uri.parse('https://karelib.000webhostapp.com/bookadd.php');
  var scanbookapi = Uri.parse('https://karelib.000webhostapp.com/scanbook.php');
  var outsourebookapi =
      Uri.parse('https://karelib.000webhostapp.com/outsourebook.php');
  var dashapi = Uri.parse('https://karelib.000webhostapp.com/dashboard.php');
  var totalbooks =
      Uri.parse('https://karelib.000webhostapp.com/totalbooks.php');

  Future loginfun(String userid, String password) async {
    var data = {'staffid': userid, 'password': password};
    var response = await http.post(loginapi, body: json.encode(data));
    var message = jsonDecode(response.body);
    return message;
  }

  Future dashboardfun() async {
    var response = await http.get(dashapi);
    var message = jsonDecode(response.body);
    return message;
  }

  Future totbookfun() async {
    var response = await http.get(totalbooks);
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

  Future bookadd(String bookname, String bookno, String rowno) async {
    var data = {
      'bookname': bookname,
      'bookno': bookno,
      'rowno': rowno,
    };
    var response = await http.post(bookaddapi, body: json.encode(data));

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
