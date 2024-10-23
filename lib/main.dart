

// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:myapp/screen/business_hours_screen.dart';

// import 'package:myapp/screens/forminfo_screen.dart';
// // import 'package:myapp/screens/forminfo_screen.dart';
// import 'package:myapp/screens/login_screen.dart';
// import 'package:myapp/screens/otp_screen.dart';
// // import 'package:myapp/screens/signup_screen.dart';
// import 'package:myapp/screens/signup_with_google.dart';
// import 'package:firebase_core/firebase_core.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // Initialize Firebase here
//   runApp(const FarmerEatsApp()); // Ensure the correct app is run
// }

// class FarmerEatsApp extends StatelessWidget {
//   const FarmerEatsApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'FarmerEats',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.brown[800],
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Text(
//               'Welcome back!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 const Text('New here? ', style: TextStyle(color: Colors.grey)),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => FarmInfoScreen(
//                                 onContinue: () {}, onBack: () {  },
//                               )),
//                     );
//                   },
//                   child: const Text(
//                     'Create account',
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.email),
//                 labelText: 'Email Address',
//                 border: const OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               obscureText: _obscureText,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.lock),
//                 labelText: 'Password',
//                 border: const OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 suffixIcon: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                   child: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const EmailOTPScreen()),
//                   );
//                 },
//                 child: const Text(
//                   'Forgot?',
//                   style: TextStyle(color: Colors.orange),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BusinessHoursScreen(
//                               onContinue: () {},
//                               onBack: () {},
//                             )),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('Login'),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Center(child: Text('or login with')),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SignInButton(
//                   Buttons.Google,
//                   mini: false,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const SignupWithGoogle()),
//                     );
//                   },
//                 ),
//                 const SizedBox(width: 10),
//                 SignInButton(
//                   Buttons.Apple,
//                   mini: true,
//                   onPressed: () {
//                     // Apple login action
//                   },
//                 ),
//                 const SizedBox(width: 10),
//                 SignInButton(
//                   Buttons.Facebook,
//                   mini: true,
//                   onPressed: () {
//                     // Facebook login action
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screen/onbording_screen.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FarmerEatsApp());
}

class FarmerEatsApp extends StatelessWidget {
  const FarmerEatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(onContinue: () {  }, onBack: () {  },), // Changed initial route to OnboardingScreen
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}