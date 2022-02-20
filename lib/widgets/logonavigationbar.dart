import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  MainAppBar({Key? key}) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: const Icon(
      //   Icons.face,
      //   color: Colors.white,
      //   size: 36,
      // ),
      title: const Text(
        'Friended',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 80,
          padding: const EdgeInsets.only(top: 16),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
