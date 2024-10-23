import 'package:flutter/material.dart';
import 'package:myapp/screen/fincalscreen.dart';
import 'package:myapp/screen/next_page.dart';
import 'package:myapp/screens/login_page.dart';

class NextScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  const NextScreen({super.key, required this.onBack, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Signup 2 of 4',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Farm Info',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildTextField(icon: Icons.business, hintText: 'Business Name'),
            _buildTextField(icon: Icons.language, hintText: 'Internet Name'),
            _buildTextField(icon: Icons.home, hintText: 'Street Address'),
            _buildTextField(icon: Icons.location_city, hintText: 'City'),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(hintText: 'State'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(hintText: 'Enter Zipcode'),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Verify Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onBack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                          onBack: () {},
                          onContinue: () {},
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({IconData? icon, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildDropdown({required String hintText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        items: const [], // Add state items here
        onChanged: (value) {},
      ),
    );
  }
}
