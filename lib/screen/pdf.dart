import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:myapp/screen/fincalscreen.dart';  // Import the FinalScreen

class Verification extends StatefulWidget {
  const Verification({super.key, required Null Function() onBack, required Null Function() onContinue});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<Verification> {
  File? _selectedFile;
  String? _fileName;

  final picker = ImagePicker();

  // Function to pick a PDF file
  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _fileName = path.basename(_selectedFile!.path);
      });
    }
  }

  // Function to capture an image using the camera
  Future<void> _captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
        _fileName = path.basename(_selectedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),  // Navigate back to the previous screen
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Signup 3 of 4',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Attach proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Show dialog to choose between capturing an image or selecting a PDF
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Capture Image'),
                            onTap: () {
                              _captureImage();
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.upload_file),
                            title: const Text('Upload PDF'),
                            onTap: () {
                              _pickPDF();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                label: const Text('Attach proof of registration'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedFile != null) 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _fileName ?? 'No file selected',
                          style: TextStyle(color: _fileName != null ? Colors.black : Colors.grey),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _selectedFile = null;
                            _fileName = null;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedFile != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Fincalscreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please attach a file before continuing')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
