import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/discover/discover_page.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/message/message_page.dart';
import 'package:flutter_social_media/presentation/features/settings/settings_page.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  Widget showBody() {
    switch (_page) {
      case 0:
        return const HomePage(
          id: '',
        );
        break;
      case 1:
        return const DiscoverPage();
        break;
      case 2:
        return const MessagePage();
        break;
      default:
        return const SettingsPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showBody(),
      bottomNavigationBar: Container(
        color: AppColor.colorWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: GNav(
            backgroundColor: AppColor.colorWhite,
            color: AppColor.colorGrey,
            activeColor: AppColor.colorPink,
            tabBackgroundColor: AppColor.colorPink.withOpacity(0.1),
            gap: 16,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                _page = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.explore,
                text: 'Discover',
              ),
              GButton(
                icon: Icons.message,
                text: 'Message',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
      // BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.home),
      //       label: 'Home',
      //       activeIcon: Container(
      //           decoration: const BoxDecoration(
      //               color: Colors.orange, shape: BoxShape.circle),
      //           child: const Padding(
      //               padding: EdgeInsets.all(8.0), child: Icon(Icons.settings))),
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: 'Discover',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: 'Message',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   selectedItemColor: AppColor.colorPink,
      //   unselectedItemColor: AppColor.colorGrey,
      //   // onTap: (),
      // ),
    );
  }
}

///dùng int để push qua push lại các body như bottom navigation bar