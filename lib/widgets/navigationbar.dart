import 'package:demo_app/helpers/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget buildNavigation() => Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//             onPressed: () {},
//             child: const Icon(
//               Icons.clear,
//               color: Colors.orange,
//               size: 30,
//             )),
//         ElevatedButton(
//             onPressed: () {},
//             child: const Icon(
//               Icons.star,
//               color: Colors.orange,
//               size: 30,
//             )),
//         ElevatedButton(
//             onPressed: () {},
//             child: const Icon(
//               Icons.favorite,
//               color: Colors.orange,
//               size: 30,
//             )),
//         ElevatedButton(
//             onPressed: () {},
//             child: const Icon(
//               CupertinoIcons.chat_bubble_fill,
//               color: Colors.orange,
//               size: 30,
//             )),
//       ],
//     );

final items = <Widget>[
  Icon(Icons.clear, color: AppColors.MAIN_COLOR, size: 40),
  Icon(Icons.star, color: AppColors.MAIN_COLOR, size: 40),
  Icon(Icons.home, color: AppColors.MAIN_COLOR, size: 40),
  Icon(Icons.favorite, color: AppColors.MAIN_COLOR, size: 40),
  Icon(Icons.chat_bubble, color: AppColors.MAIN_COLOR, size: 40),
];
