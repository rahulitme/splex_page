

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Initialize Firebase in main.dart before running the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const MyApp(),
        '/forminfoScreen': (context) =>
            const MyApp(), // Route for FormInfoScreen
        // Example of another route
      },
    );
  }
}

class BusinessDetailsScreen {
  const BusinessDetailsScreen();
}

class DefaultFirebaseOptions {
  // ignore: prefer_typing_uninitialized_variables
  static var currentPlatform; // Your Firebase options implementation
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String _errorMessage = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'createdAt': Timestamp.now(),
      });

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/business-details');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = _getErrorMessage(e.code);
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered. Please login instead.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'weak-password':
        return 'Password is too weak. Please use a stronger password.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FarmerEats',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Signup 1 of 4',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _socialButton('assets/google.png', () {}),
                    _socialButton('assets/apple.png', () {}),
                    _socialButton('assets/facebook.png', () {}),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'or signup with',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person_outline,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Name is required' : null,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Phone number is required'
                      : null,
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: _obscurePassword,
                  validator: _validatePassword,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  label: 'Re-enter Password',
                  obscureText: _obscureConfirmPassword,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onToggle: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                ),
                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/RegistrationFlow  '),
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleSignup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD97055),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('continous'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String asset, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(asset, height: 24),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: GestureDetector(
          onTap: onToggle,
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }
}
