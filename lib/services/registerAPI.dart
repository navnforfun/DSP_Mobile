import 'dart:core';
import 'package:dsp/store/constant.dart' as app;
import 'dart:convert';
import 'package:http/http.dart' as http;

//
// String username = '';
// String password = '';
// String repass = '';
// String email = '';
var data;
var statusCode;

Future<void> register(username, password, repass) async {
  var res = await http.post(Uri.parse(app.host + 'Account/Register'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: jsonEncode(
          {"userName": username, "passWord": password, "rePass": repass}));

  statusCode = res.statusCode;
  data = res.body;

}
