import 'package:flutter/material.dart';
import 'package:myapp/screen/fincalscreen.dart';
import 'business_hours_screen.dart';

class Navigation extends StatelessWidget {
  const Navigation(
      {super.key,
      required Null Function() onContinue,
      required Null Function() onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('final last'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessHoursScreen(
                      onContinue: () {},
                      onBack: () {},
                    ),
                  ),
                );
              },
              child: const Text('Go to Business Hours Screen'),
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
