import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupWithGoogle extends StatefulWidget {
  const SignupWithGoogle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupWithGoogleState createState() => _SignupWithGoogleState();
}

class _SignupWithGoogleState extends State<SignupWithGoogle> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isSigningIn = false;

  Future<User?> _signInWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      // Trigger the Google authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        setState(() {
          _isSigningIn = false;
        });
        return null; // User canceled the sign-in process
      }

      // Retrieve the Google authentication credentials
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential for Firebase authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      setState(() {
        _isSigningIn = false;
      });

      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        _isSigningIn = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup with Google'),
      ),
      body: Center(
        child: _isSigningIn
            ? const CircularProgressIndicator() // Show loading indicator while signing in
            : ElevatedButton.icon(
                icon: Image.asset('assets/cover.png', height: 24.0), // Replace with your Google icon asset
                label: const Text('Sign up with Google'),
                onPressed: () async {
                  User? user = await _signInWithGoogle();
                  if (user != null) {
                    // User successfully signed in
                    // Show success message using a SnackBar
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Signed in as ${user.displayName}'),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
