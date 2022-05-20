import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/services/auth_api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextbox = TextEditingController();
  TextEditingController passwordTextbox = TextEditingController();
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Screen",
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Lottie.asset("assets/movie_img.json"),
                    ),
                  ),
                ),
                //Email Text Box
                TextFormField(
                  controller: emailTextbox,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "jonh.doe@email.com",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    //create label
                    labelText: 'Type your email',
                    //label style
                    labelStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordTextbox,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "********",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    //create label
                    labelText: 'Type your password',
                    //label style
                    labelStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                //Button
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Material(
                    color: Colors.black26,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: InkWell(
                      splashColor: Colors.black26,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      onTap: () {},
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () async {
                          if (emailTextbox.text.isEmpty &&
                              passwordTextbox.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please Enter your Credentials'),
                            ));
                            // print("Please enter your Credentials");
                          } else if (emailTextbox.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Email is empty'),
                            ));
                            // print("Email is empty");
                          } else if (passwordTextbox.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Password is empty'),
                            ));
                            // print("Password is empty");
                          } else {
                            // print(passwordTextbox.text);
                            // print(emailTextbox.text);
                            final email = emailTextbox.text;
                            final password = passwordTextbox.text;
                            authServices.getToken(
                                email: email,
                                password: password,
                                context: context);

                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomeScreen(),
                            //     ));
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
