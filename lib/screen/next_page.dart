import 'package:flutter/material.dart';
import 'package:myapp/screen/fincalscreen.dart';
import 'package:myapp/screen/pdf.dart';  

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required Null Function() onBack, required Null Function() onContinue});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreen createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  // Track selected days and time slots
  List<bool> selectedDays = [false, false, false, false, false, false, false];
  Map<String, List<bool>> selectedTimeSlots = {
    'M': [false, false, false, false],
    'T': [false, false, false, false],
    'W': [false, false, false, false],
    'Th': [false, false, false, false],
    'F': [false, false, false, false],
    'S': [false, false, false, false],
    'Su': [false, false, false, false],
  };

  // List of time slot labels
  final List<String> timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ];

  // Handle day selection
  void toggleDaySelection(int index) {
    setState(() {
      selectedDays[index] = !selectedDays[index];
    });
  }

  // Handle time slot selection
  void toggleTimeSlotSelection(String day, int index) {
    setState(() {
      selectedTimeSlots[day]![index] = !selectedTimeSlots[day]![index];
    });
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Signup 4 of 4',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Business Hours',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Days of the week selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                final dayLabels = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
                return GestureDetector(
                  onTap: () => toggleDaySelection(index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedDays[index] ? Colors.orange : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      dayLabels[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            // Time slots grid
            Expanded(
              child: GridView.builder(
                itemCount: timeSlots.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.5,
                ),
                itemBuilder: (context, index) {
                  String currentDay = 'W'; // Example of selected day (Wednesday)
                  return GestureDetector(
                    onTap: () => toggleTimeSlotSelection(currentDay, index),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedTimeSlots[currentDay]![index]
                            ? Colors.orange
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          timeSlots[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Signup button to navigate to the next screen
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen (e.g., ConfirmationScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Verification(onBack: () {  }, onContinue: () {  },),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Signup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of the next screen (ConfirmationScreen)







// Import the FinalScreen

// class VerificationScreen extends StatelessWidget {
//   const VerificationScreen({super.key, required Null Function() onBack, required Null Function() onContinue});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FarmerEats'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),  // Navigate back to FarmInfoScreen
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Signup 3 of 4',
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Verification',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 32),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // Implement image attachment logic here
//                 },
//                 icon: const Icon(Icons.camera_alt, color: Colors.white),
//                 label: const Text('Attach proof of registration'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Fincalscreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('Continue'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }