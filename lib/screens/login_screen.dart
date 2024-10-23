// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class BusinessHoursScreen extends StatefulWidget {
//   const BusinessHoursScreen(
//       {super.key,
//       required void Function() onContinue,
//       required void Function() onBack});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BusinessHoursScreenState createState() => _BusinessHoursScreenState();
// }

// class _BusinessHoursScreenState extends State<BusinessHoursScreen> {
//   final List<String> timeSlots = [
//     '8:00am - 10:00am',
//     '10:00am - 1:00pm',
//     '1:00pm - 4:00pm',
//     '4:00pm - 7:00pm',
//     '7:00pm - 10:00pm'
//   ];

//   final List<String> weekDays = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
//   Set<String> selectedDays = {'W'};
//   Set<String> selectedTimeSlots = {'8:00am - 10:00am', '10:00am - 1:00pm'};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'FarmerEats',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Signup 4 of 4',
//                 style: TextStyle(color: Colors.grey, fontSize: 16),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Business Hours',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Choose the hours your farm is open for pickups.\nThis will allow customers to order deliveries.',
//                 style: TextStyle(color: Colors.grey, fontSize: 16),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: weekDays.map((day) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (selectedDays.contains(day)) {
//                           selectedDays.remove(day);
//                         } else {
//                           selectedDays.add(day);
//                         }
//                       });
//                     },
//                     child: _DayButton(
//                       day: day,
//                       isSelected: selectedDays.contains(day),
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 24),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: timeSlots.length,
//                   itemBuilder: (context, index) {
//                     final timeSlot = timeSlots[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             if (selectedTimeSlots.contains(timeSlot)) {
//                               selectedTimeSlots.remove(timeSlot);
//                             } else {
//                               selectedTimeSlots.add(timeSlot);
//                             }
//                           });
//                         },
//                         child: _TimeSlotButton(
//                           timeSlot: timeSlot,
//                           isSelected: selectedTimeSlots.contains(timeSlot),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (kDebugMode) {
//                         print('Selected Days: $selectedDays');
//                       }
//                       if (kDebugMode) {
//                         print('Selected Time Slots: $selectedTimeSlots');
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFD97055),
//                       minimumSize: const Size(120, 48),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                     child: const Text('Signup',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _DayButton extends StatelessWidget {
//   final String day;
//   final bool isSelected;

//   const _DayButton({
//     required this.day,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFFD97055) : Colors.grey[200],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: Text(
//           day,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _TimeSlotButton extends StatelessWidget {
//   final String timeSlot;
//   final bool isSelected;

//   const _TimeSlotButton({
//     required this.timeSlot,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFFFFE8C4) : Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         timeSlot,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
