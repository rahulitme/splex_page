import 'package:flutter/material.dart';
import 'package:myapp/screen/fincalscreen.dart';
import 'final_screen.dart';
import 'package:myapp/screens/login_page.dart';

class BusinessHoursScreen extends StatelessWidget {
  const BusinessHoursScreen(
      {super.key,
      required Null Function() onContinue,
      required Null Function() onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Hours'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Business Hours: 9:00 AM - 6:00 PM',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fincalscreen(),
                  ),
                );
              },
              child: const Text('Go to Final Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
