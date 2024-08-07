import 'package:batch_bhutan/1st_project/data/SignIn_list.dart';
import 'package:batch_bhutan/1st_project/model/SignIn_model.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:batch_bhutan/main_information/LogIn.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isRePasswordObscured = true;

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
                            width: 250,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Registration",style: myStyal(35,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/Doctors/lo.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: _firstNameController,
                            label: "First Name",
                            hint: "First Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter first name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _lastNameController,
                            label: "Last Name",
                            hint: "Last Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter last name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _emailController,
                            label: "Email",
                            hint: "Enter your email",
                            suffixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter email";
                              }
                              if (!value.contains("@")) {
                                return "Enter a valid email address";
                              }
                              if (!value.contains("gmail.com")) {
                                return "Email should contain 'gmail.com'";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _passwordController,
                            label: "Password",
                            hint: "Enter your password",
                            obscureText: _isPasswordObscured,
                            suffixIcon: _isPasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onSuffixIconPressed: () {
                              setState(() {
                                _isPasswordObscured = !_isPasswordObscured;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _rePasswordController,
                            label: "Re-enter Password",
                            hint: "Re-enter your password",
                            obscureText: _isRePasswordObscured,
                            suffixIcon: _isRePasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onSuffixIconPressed: () {
                              setState(() {
                                _isRePasswordObscured = !_isRePasswordObscured;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please re-enter your password";
                              }
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            color: forthColor,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                userData.add(
                                  Register(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => Login()),
                                      (route) => false,
                                );
                              }
                            },
                            child: Text(
                              "Register Now",
                              style: Styal(18, Colors.white,FontWeight.bold),
                            ),
                          ),
                        ],
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
    void Function()? onSuffixIconPressed,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        )
            : null,
      ),
      validator: validator,
    );
  }
}
