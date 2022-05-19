import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/views/home.dart';

class AuthServices {
  getToken(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var url = Uri.parse('https://reqres.in/api/login');
    var response = await http
        .post(url, body: {'email': '${email}', 'password': '${password}'});
    print('Response status: ${response.statusCode}');
    print('Response body is: ${response.body}');
    if (response.statusCode != 200) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ERROR CREDENTIALS WRONG'),
      ));
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.body.toString());
      final String? token = prefs.getString('token');
      print("MY NEW TOKEN $token");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success'),
      ));
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      print(response.body);
    }
  }
}
