import 'package:flutter/material.dart';
import 'package:dsp/services/loginAPI.dart' as loginApi;
import 'home.dart';
import 'package:dsp/store/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dsp/store/constant.dart' as app;
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool _isLoading = false;

  void test() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
                'Login',
              ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Username'),
            controller: username,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
            controller: password,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.purple,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              // print(username.text);
              // print(password.text);
              setState(() {
                _isLoading = true;
              });

              await loginApi.login(username.text, password.text);
              setState(() {
                _isLoading = false;
              });
              // print(loginApi.data);
              if (loginApi.statusCode == 200) {
                user.setUser(loginApi.data);
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Error'),
                    content:  Text(loginApi.data.toString()),
                  ),
                );
              }
            },
            child: _isLoading
                ? LoadingAnimationWidget.staggeredDotsWave(color: app.red_600, size: 20)
                : Text('Dang nhap'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Text('Dang ky'),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
