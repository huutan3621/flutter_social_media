import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/discover/discover_container/discover_container.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Discover",
          style: tStyle.display32().w500().copyWith(color: AppColor.colorPink),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.2,
                    color: AppColor.colorGrey.withOpacity(0.2),
                    strokeAlign: StrokeAlign.inside,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: const Icon(Icons.notifications,
                    color: AppColor.colorPink, size: 24.0),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  DiscoverContainer(
                    title: "Music taste",
                    imagePath: "assets/images/discoverPhoto1.jpg",
                  ),
                  DiscoverContainer(
                    title: "Your soulmate",
                    imagePath: "assets/images/discoverPhoto2.jpeg",
                  ),
                  DiscoverContainer(
                    title: "Friend to chat",
                    imagePath: "assets/images/discoverPhoto3.jpg",
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  DiscoverContainer(
                    title: "Similar habits",
                    imagePath: "assets/images/discoverPhoto4.jpg",
                  ),
                  DiscoverContainer(
                    title: "A dating night",
                    imagePath: "assets/images/discoverPhoto5.jpg",
                  ),
                  DiscoverContainer(
                    title: "Same industry",
                    imagePath: "assets/images/discoverPhoto6.jpg",
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
