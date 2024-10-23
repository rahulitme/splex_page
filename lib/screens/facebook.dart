import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Initialize Facebook Auth for Web
void initializeFacebookAuth() {
  if (kIsWeb) {
    // Initialize Facebook Auth specifically for web platform
    FacebookAuth.i.webInitialize(
      appId: "1292439712193366", // Replace with your Facebook App ID
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
}

class FacebookSignInDemo extends StatefulWidget {
  const FacebookSignInDemo({super.key});

  @override
  State<FacebookSignInDemo> createState() => _FacebookSignInDemoState();
}

class _FacebookSignInDemoState extends State<FacebookSignInDemo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize Facebook Auth when the widget is created
    initializeFacebookAuth();
  }

  Future<User?> _signInWithFacebook() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Trigger the Facebook authentication flow with specific permissions
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        // Get the Facebook access token
        final AccessToken? accessToken = result.accessToken;

        if (accessToken?.token == null) {
          throw Exception('Facebook access token is null');
        }

        // Create a credential from the Facebook access token
        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken!.token,
        );

        // Sign in to Firebase
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      } else if (result.status == LoginStatus.cancelled) {
        if (kDebugMode) {
          print('Facebook login cancelled by user');
        }
        return null;
      } else {
        throw Exception('Facebook login failed: ${result.status}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during Facebook login: $e');
      }
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Login'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  try {
                    final User? user = await _signInWithFacebook();
                    if (user != null && mounted) {
                      if (kDebugMode) {
                        print('Successfully logged in: ${user.displayName}');
                      }
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Welcome, ${user.displayName}!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Sign in with Facebook'),
              ),
      ),
    );
  }
}

extension on AccessToken? {
  get token => null;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize plugins before running the app
  if (kIsWeb) {
    await FacebookAuth.i.webInitialize(
      appId: "1292439712193366", // Replace with your Facebook App ID
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }

  runApp(
    const MaterialApp(
      home: FacebookSignInDemo(),
    ),
  );
}

extension on FacebookAuth {
  webInitialize(
      {required String appId,
      required bool cookie,
      required bool xfbml,
      required String version}) {}
}
