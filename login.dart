import 'package:flutter/material.dart';

import 'registration.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      if (emailController.text.trim().toLowerCase() ==
              RegistrationPage.email &&
          passwordController.text ==
              RegistrationPage.password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid Email or Password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void openRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationPage(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),

            child: Form(
              key: formKey,

              child: Column(
                children: [
                  Icon(
                    Icons.local_hospital,
                    size: 90,
                    color: Colors.teal,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'MediCare Hospital',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Patient Login',
                    style: TextStyle(fontSize: 22),
                  ),

                  SizedBox(height: 30),

                  TextFormField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter email';
                      }

                      String pattern =
                          r'^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$';

                      if (!RegExp(pattern).hasMatch(value.trim())) {
                        return 'Invalid email';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    controller: passwordController,

                    obscureText: true,

                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),

                      onPressed: login,

                      child: Text('Login'),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Don't have an account?"),

                      TextButton(
                        onPressed: openRegistration,

                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}