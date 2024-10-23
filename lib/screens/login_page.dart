import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:myapp/screen/varificaionscreee.dart';
import 'package:myapp/screens/facebook.dart';
import 'package:myapp/screens/forminfo_screen.dart';
import 'otp_screen.dart';
import 'signup_with_google.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 50),
            _buildWelcomeText(),
            _buildSignupLink(),
            const SizedBox(height: 30),
            _buildEmailField(),
            const SizedBox(height: 20),
            _buildPasswordField(),
            _buildForgotPassword(),
            const SizedBox(height: 20),
            _buildLoginButton(),
            const SizedBox(height: 20),
            _buildSocialLoginSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'FarmerEats',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.brown[800],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'Welcome back!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSignupLink() {
    return Row(
      children: [
        const Text('New here? ', style: TextStyle(color: Colors.grey)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FarmInfoScreen(
                  onContinue: () {},
                  onBack: () {},
                ),
              ),
            );
          },
          child: const Text(
            'Create account',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        labelText: 'Email Address',
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: 'Password',
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmailOTPScreen()),
          );
        },
        child: const Text(
          'Forgot?',
          style: TextStyle(color: Colors.orange),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextScreen(
                onContinue: () {},
                onBack: () {},
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text('Login'),
      ),
    );
  }

  Widget _buildSocialLoginSection() {
    return Column(
      children: [
        const Text('or login with'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Google,
              mini: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupWithGoogle(),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            SignInButton(
              Buttons.Apple,
              mini: true,
              onPressed: () {
                // Apple login action
              },
            ),
            const SizedBox(width: 10),
            SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FacebookSignInDemo(),
                  ),
                );
              },
            ),
            // Facebook login action
          ],
        ),
      ],
    );
  }
}
