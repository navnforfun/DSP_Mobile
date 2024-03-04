import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class user {
  static late String userName;
  static late String name;
  static late String role;
  static late String img;
  static late String email;

  static Future<void> setUser(String jwt) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
    print(decodedToken);
    userName = decodedToken['userName'];
    name = decodedToken['name'];
    img = decodedToken['img'];
    role = decodedToken['name'];
    email = decodedToken['email'];
    await prefs.setString('userName', userName);
    await prefs.setString('name', name);
    await prefs.setString('role', role);
    await prefs.setString('img', img);
    await prefs.setString('email', email);
  }

}
