import 'package:flutter/material.dart';

import 'login.dart';
import 'registration.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MediCare Hospital'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.health_and_safety,
              size: 100,
              color: Colors.teal,
            ),

            SizedBox(height: 20),

            Text(
              'Welcome ${RegistrationPage.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            SizedBox(height: 15),

            Text(
              'Welcome to MediCare Hospital',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),

            Text(
              'Email: ${RegistrationPage.email}',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),

              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },

              icon: Icon(Icons.logout),

              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}