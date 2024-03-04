import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dsp/store/constant.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

var data;
var statusCode;

Future<void> login(username, password) async {
  final prefs = await SharedPreferences.getInstance();

// Save the counter value to persistent storage under the 'counter' key.
  await prefs.setInt('counter', 5);

  try {
    print('run');
    // var x = constant.host;
    var res = await http.post(Uri.parse(app.host + 'Account/Login'),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: convert.jsonEncode({"userName": username, "passWord": password}));

    // Map data = convert.jsonDecode(res.body);
    // print(data);
    // print(res.body);
    data = res.body;
    statusCode = res.statusCode;
  } catch (e) {
    data = 'error';
    statusCode = 400;
    print(e);
  }
}
