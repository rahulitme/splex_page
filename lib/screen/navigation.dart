import 'package:flutter/material.dart';
import 'package:myapp/screen/finallast.dart';
import 'package:myapp/screen/fincalscreen.dart';
import 'business_hours_screen.dart';
import 'final_screen.dart'; 

// This imports the FinalScreen

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Screen'),
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
                    builder: (context) => Navigation(onContinue: () {  }, onBack: () {  },),
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
                    builder: (context) => Navigation(onContinue: () {  }, onBack: () {  },),
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
