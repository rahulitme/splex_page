import 'package:flutter/material.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Last Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for using our app!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first page of the app
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Back to Start'),
            ),
          ],
        ),
      ),
    );
  }
}