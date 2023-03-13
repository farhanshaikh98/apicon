import 'package:demo_test/screens/signin.dart';
import 'package:flutter/material.dart';

import '../components/reusable_button.dart';
import '../components/reusable_textformfield.dart';
import '../services/api_manager.dart';
import '../services/user_service.dart';
import '../utils/validations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  Future<APIResponse> onLogIn(
      String userName,
      String email,
      String pass,
      String phone,
      String occu,
      String address,
      String city,
      String country,
      String state) async {
    return await APIService.Signup(
        userName, email, pass, phone, occu, address, city, country, state);
  }

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  bool btnActivationStatus = false;
  final _loginKey = GlobalKey<FormState>();

  signupHandle() async {
    ValidationUtils.showLoaderDialog(context: context);
    widget
        .onLogIn(
            usernameController.text,
            emailController.text,
            passwordController.text,
            phonenumberController.text,
            occupationController.text,
            addressController.text,
            cityController.text,
            countryController.text,
            stateController.text)
        .then((APIResponse response) {
      if (response.success == true) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        phonenumberController.clear();
        occupationController.clear();
        addressController.clear();
        cityController.clear();
        countryController.clear();
        stateController.clear();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/backarrow.png",
                      height: 60,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "quis nostrud exercitation ullamco laboris nisi ut",
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 120, 120, 120)),
                  ),
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
                    hintext: "Full Name",
                    suffixIcon: Icon(
                      Icons.person,
                      size: 20,
                    )
                    //  Image.asset(
                    //   "assets/images/Icon - Profile.png",
                    //   cacheHeight: 20,
                    // ),
                    ),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: emailController,
                    obscureText: false,
                    hintext: "email ID",
                    suffixIcon: Icon(
                      Icons.email,
                      size: 20.0,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: passwordController,
                    obscureText: false,
                    hintext: "password",
                    suffixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: phonenumberController,
                    obscureText: false,
                    hintext: "phone number",
                    suffixIcon: Icon(
                      Icons.phone,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: occupationController,
                    obscureText: false,
                    hintext: "occupation",
                    suffixIcon: Icon(
                      Icons.sensor_occupied,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: addressController,
                    obscureText: false,
                    hintext: "address",
                    suffixIcon: Icon(
                      Icons.location_city,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: cityController,
                    obscureText: false,
                    hintext: "city",
                    suffixIcon: Icon(
                      Icons.location_city_outlined,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: countryController,
                    obscureText: false,
                    hintext: "country",
                    suffixIcon: Icon(
                      Icons.person,
                      size: 20,
                    )),
                ReusableTextFormField(
                    onchange: (v) => validateFieldsEnter(),
                    textcapitalization: TextCapitalization.none,
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    controller: stateController,
                    obscureText: false,
                    hintext: "state",
                    suffixIcon: Icon(
                      Icons.person,
                      size: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableButton(
                    buttonColor: btnActivationStatus
                        ? Colors.green
                        : const Color(0xFFAEAEAE),
                    buttonName: "SignUp",
                    onPressed: () {
                      if (btnActivationStatus) {
                        signupHandle();
                      }
                    }),
                SizedBox(height: 25),
                Text(
                  "OR",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 120, 120, 120)),
                ),
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
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "Already have an Account ? Sign In",
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
