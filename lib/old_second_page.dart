// import 'package:flutter/material.dart';

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     final List<int> randomNumbers = args['randomNumbers'];
//     final List<int> positions = args['positions'];
//     final List<TextEditingController> controllers = List.generate(3, (index) => TextEditingController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Numbers'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               for (int i = 0; i < 3; i++) ...[
//                 TextField(
//                   controller: controllers[i],
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Enter number at position ${positions[i] + 1}',
//                   ),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 24),
//                 ),
//                 SizedBox(height: 20),
//               ],
//               ElevatedButton(
//                 onPressed: () {
//                   bool isCorrect = true;
//                   for (int i = 0; i < 3; i++) {
//                     if (int.tryParse(controllers[i].text) != randomNumbers[positions[i]]) {
//                       isCorrect = false;
//                       break;
//                     }
//                   }
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(isCorrect ? 'Correct!' : 'Incorrect, try again.'),
//                     ),
//                   );
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
