import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/sign_in/sign_in_page.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  int _indexPage = 0;

  Widget bodyFunction() {
    switch (_indexPage) {
      case 0:
        return const SignInPage();
        break;
      case 1:
        return Container(color: Colors.blue);
        break;
      case 2:
        return Container(color: Colors.orange);
        break;
      default:
        return Container(color: Colors.white);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: _bottomNavigationKey,
      currentIndex: _indexPage,
      onTap: (index) {
        setState(() {
          _indexPage = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "Messege",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Setting",
        ),
      ],
      selectedItemColor: AppColor.colorPink,
      unselectedItemColor: AppColor.colorGrey,
      showUnselectedLabels: false,
    );
  }
}
