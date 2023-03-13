import 'package:demo_test/screens/home_page.dart';
import 'package:demo_test/screens/signup.dart';
import 'package:flutter/material.dart';

import '../components/reusable_button.dart';
import '../components/reusable_textformfield.dart';
import '../services/api_manager.dart';
import '../services/user_service.dart';
import '../utils/validations.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  Future<APIResponse> onLogIn(String userName, String password) async {
    return await APIService.login(userName, password);
  }

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool btnActivationStatus = false;
  final _loginKey = GlobalKey<FormState>();

  loginHandle() async {
    ValidationUtils.showLoaderDialog(context: context);
    widget
        .onLogIn(usernameController.text, passwordController.text)
        .then((APIResponse response) {
      if (response.success == true) {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        usernameController.clear();
        passwordController.clear();
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('user name or password is incorrect'),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
          ),
        ));
      }
    });
  }

  validateFieldsEnter() {
    if (ValidationUtils.isFieldEmpty(usernameController.text) &&
        ValidationUtils.isFieldEmpty(passwordController.text)) {
      setState(() {
        btnActivationStatus = true;
      });
    } else {
      setState(() {
        btnActivationStatus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 70,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    // width: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "quis nostrud exercitation ullamco laboris nisi ut",
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 120, 120, 120)),
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: usernameController,
                    obscureText: false,
                    hintext: "Email Address",
                    suffixIcon: Icon(
                      Icons.mail,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: passwordController,
                    obscureText: false,
                    hintext: "Password",
                    suffixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 75, 117)),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                ReusableButton(
                  buttonColor: btnActivationStatus
                      ? Colors.green
                      : const Color(0xFFAEAEAE),
                  buttonName: "Login",
                  onPressed: () {
                    if (btnActivationStatus) {
                      loginHandle();
                    }
                  },
                ),
                SizedBox(height: 25),
                Text("OR"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/googleicon.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/fb.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/twitterricon.png",
                      height: 74,
                      width: 75,
                    ),
                    Image.asset(
                      "assets/images/appleicon.png",
                      height: 74,
                      width: 75,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Dont't have an account ? Sign Up",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 79, 75, 75)),
                  ),
                ),
                SizedBox(height: 35),
              ],
            ),
          )),
    ));
  }
}
