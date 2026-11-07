import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static String name = '';
  static String email = '';
  static String phone = '';
  static String password = '';

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void register() {
    if (formKey.currentState!.validate()) {

      RegistrationPage.name =
          nameController.text.trim();

      RegistrationPage.email =
          emailController.text.trim().toLowerCase();

      RegistrationPage.phone =
          phoneController.text.trim();

      RegistrationPage.password =
          passwordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Successful'),
          backgroundColor: Colors.teal,
        ),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Registration'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [

              const Icon(
                Icons.local_hospital,
                size: 80,
                color: Colors.teal,
              ),

              const SizedBox(height: 15),

              const Text(
                'Create Patient Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Name

              TextFormField(
                controller: nameController,

                decoration: const InputDecoration(
                  labelText: 'Patient Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Email

              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
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

              const SizedBox(height: 15),

              // Phone

              TextFormField(
                controller: phoneController,

                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter phone number';
                  }

                  String pattern = r'^[0-9]{11}$';

                  if (!RegExp(pattern).hasMatch(value.trim())) {
                    return 'Enter 11 digit phone number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Password

              TextFormField(
                controller: passwordController,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }

                  if (value.length < 6) {
                    return 'Password must be 6 characters';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Confirm Password

              TextFormField(
                controller: confirmController,

                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password';
                  }

                  if (value != passwordController.text) {
                    return 'Password does not match';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // Register Button

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),

                  onPressed: register,

                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}