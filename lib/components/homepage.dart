import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_app/helpers/appcolors.dart';
import 'package:demo_app/widgets/imagecard.dart';
import 'package:demo_app/widgets/logonavigationbar.dart';
import 'package:demo_app/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/widgets/card_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final index = 2;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.MAIN_COLOR, Colors.grey.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: MainAppBar()),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // buildLogo(),
                Expanded(child: buildCards()),
                const SizedBox(
                  height: 16,
                ),
                // buildNavigation(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(
              color: AppColors.SECONDARY_COLOR,
            ),
          ),
          child: CurvedNavigationBar(
            // color: AppColors.SECONDARY_COLOR,
            backgroundColor: Colors.transparent,
            // buttonBackgroundColor: Colors.white,
            height: 55,
            index: index,
            items: items,
          ),
        ),
      ));

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final imageUrls = provider.imageUrls;

    return imageUrls.isEmpty
        ? Center(
            child: ElevatedButton(
                child: const Text(
                  'Reload',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);

                  provider.resetUsers();
                }),
          )
        : Stack(
            children: imageUrls
                .map((imageUrl) => ImageCard(
                      imageUrl: imageUrl,
                      isFront: imageUrls.last == imageUrl,
                    ))
                .toList(),
          );
  }
}
