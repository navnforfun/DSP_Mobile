import 'package:flutter/material.dart';
import 'package:dsp/services/registerAPI.dart' as registerAPI;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dsp/store/constant.dart' as app;
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

// === code ===
class _registerState extends State<register> {
  final username = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();
  final email = TextEditingController();
var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dang ky"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Username'),
              controller: username,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
              controller: email,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
              controller: password,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'repassword'),
              controller: repassword,
            ),
            OutlinedButton(
                onPressed: () async {
                  print(username.text);
                  print(email.text);
                  print(password.text);
                  print(repassword.text);
                  setState(() {
                    isLoading = true;
                  });
                  await registerAPI.register(username.text, password.text, repassword.text);
                  setState(() {
                    isLoading = false;
                  });
                  print(registerAPI.statusCode);
                  print(registerAPI.data);
                  if (registerAPI.statusCode == 200) {

                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Error'),
                        content: Text(registerAPI.data.toString()),
                      ),
                    );
                  }
                },
                child: isLoading?LoadingAnimationWidget.staggeredDotsWave(color: app.yellow_500, size: 40): Text(
                  'Register',
                ))
          ],
        ),
      ),
    );
  }
}
