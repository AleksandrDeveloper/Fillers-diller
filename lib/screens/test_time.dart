// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../config/id_user_preferences.dart';
// import '../config/id_user_storage.dart';
// import '../config/test_config.dart';

// class TestTime extends StatelessWidget {
//   const TestTime({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('test')),
//       body: const TestTimeScreen(),
//     );
//   }
// }

// class TestTimeScreen extends StatelessWidget {
//   const TestTimeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final testStorag = UserIdPrefProvider();
//     final textController = TextEditingController();
//     String? text;
//     return Column(
//       children: [
//         TextField(
//           controller: textController,
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             final String testText = textController.text;
//             // await testStorag.setUserId(userId:);
//           },
//           child: const Text('set'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             text = await testStorag.getUserId() ?? 'net';
//             print(text!);
//           },
//           child: const Text('get'),
//         )
//       ],
//     );
//   }
// }
