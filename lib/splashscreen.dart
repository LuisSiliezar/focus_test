import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/login.dart';
import 'package:test_app/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        // print("No token");
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        // print(token);
      });
    }
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/splash_loader.json'),
              ),
              const Text(
                "Loading...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )
            ],
          )),
    );
  }
}
