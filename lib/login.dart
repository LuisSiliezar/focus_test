import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextbox = TextEditingController();
  TextEditingController passwordTextbox = TextEditingController();

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Email Text Box
            TextFormField(
              controller: emailTextbox,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
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
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "********",
                //make hint text
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                //create lable
                labelText: 'Type your password',
                //label style
                labelStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 40),
            //Button
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Material(
                color: Colors.black26,
                borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                child: InkWell(
                  splashColor: Colors.black26,
                  borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                  onTap: () {},
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90)),
                    ),
                    onPressed: () {
                      if (emailTextbox.text.isEmpty &&
                          passwordTextbox.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please Enter your Credentials'),
                        ));
                        print("Please enter your Credentials");
                      } else if (emailTextbox.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email is empty'),
                        ));
                        print("Email is empty");
                      } else if (passwordTextbox.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Password is empty'),
                        ));
                        print("Password is empty");
                      } else {
                        print(passwordTextbox.text);
                        print(emailTextbox.text);
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
          ],
        ),
      ),
    );
  }
}
