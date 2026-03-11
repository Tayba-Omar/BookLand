// import 'package:flutter/material.dart';
// import '../Style/Color.dart';
// import '../LibraryCollection/LibraryCollection.dart';
// import 'NavigateFun.dart';
//
//
// class Fictionscreen extends StatefulWidget {
//   const Fictionscreen({super.key});
//
//   @override
//   State<Fictionscreen> createState() => _FictionscreenState();
// }
//
// class _FictionscreenState extends State<Fictionscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//         ),
//         backgroundColor: mainColor,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios, size: 25),
//         ),
//         title: const Text(
//           "Library",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: txtMainColor),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(50),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 children: [
//                   for (var category in [
//                     "All", "Fiction", "Poetry", "History", "Literature",
//                     "Novels", "Religious", "Short Stories", "Philosophy",
//                     "Political", "Academic Books"
//                   ])
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: TextButton(
//                         onPressed: () => navigateToScreen(context, category),
//                         style: TextButton.styleFrom(
//                           backgroundColor: category == "Fiction" ? lightOrange : txtColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: Text(
//                           category,
//                           style: const TextStyle(fontSize: 18,color: txtMainColor),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: const [],
//       ),
//     );
//   }
// }
