import 'package:batch_bhutan/1st_project/data/SignIn_list.dart';
import 'package:batch_bhutan/1st_project/pages/forget_password.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:batch_bhutan/main_information/bottonNavigation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                  color: secondaryColor.withOpacity(0.6)
              ),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                    color: primaryColor.withOpacity(0.4)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 60,
                            width: 220,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Log In",style: myStyal(40,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/Doctors/lo.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              suffixIcon: Icon(Icons.email_outlined),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              }
                              if (value != userData[0].email) {
                                return "Email does not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: _passwordController,
                            obscureText: _isObs,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObs = !_isObs;
                                  });
                                },
                                icon: Icon(
                                  _isObs ? Icons.visibility_off : Icons.visibility,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              if (value != userData[0].password) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: myStyal(18, primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      color: forthColor,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_phoneEmailController.text == userData[0].email &&
                              _passwordController.text == userData[0].password) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => PracticeBottomNavBar(),
                              ),
                                  (route) => false,
                            );
                          }
                        }
                      },
                      child: Text(
                        "Log In",
                        style: myStyal(19, Colors.white, FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
