//   import 'package:demo_app/widgets/imagecard.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'card_provider.dart';

// Widget buildCards() {
//     final provider = Provider.of<CardProvider>(context);
//     final imageUrls = provider.imageUrls;

//     return imageUrls.isEmpty
//         ? Center(
//             child: ElevatedButton(
//                 child: const Text('Reload'),
//                 onPressed: () {
//                   final provider =
//                       Provider.of<CardProvider>(context, listen: false);

//                   provider.resetUsers();
//                 }),
//           )
//         : Stack(
//             children: imageUrls
//                 .map((imageUrl) => ImageCard(
//                       imageUrl: imageUrl,
//                       isFront: imageUrls.last == imageUrl,
//                     ))
//                 .toList(),
//           );
//   }
// }
