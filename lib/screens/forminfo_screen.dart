import 'package:flutter/material.dart';
import 'package:myapp/screen/next_page.dart';
import 'package:myapp/screen/varificaionscreee.dart';

class FarmInfoScreen extends StatelessWidget {
  const FarmInfoScreen(
      {super.key,
      required Null Function() onContinue,
      required Null Function() onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Signup 1 of 4',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Social Sign-Up buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_translate, size: 40), // Google
                SizedBox(width: 20),
                Icon(Icons.apple, size: 40), // Apple
                SizedBox(width: 20),
                Icon(Icons.facebook, size: 40), // Facebook
              ],
            ),
            const SizedBox(height: 10),
            const Text('or signup with'),

            const SizedBox(height: 20),

            // Full Name Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Full Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Email Address Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email Address',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Phone Number Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                labelText: 'Phone Number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Re-enter Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Re-enter Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),

            // Continue Button
            ElevatedButton(
              onPressed: () {
                // Navigate to VerificationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextScreen(
                      onBack: () {
                        Navigator.pop(context); // Go back to FarmInfoScreen
                      },
                      onContinue: () {
                        // Logic to navigate to the next screen
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.deepOrangeAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),

            // Login Link
            GestureDetector(
              onTap: () {
                // Logic for navigating to the login screen
              },
              child: const Text('Login', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
