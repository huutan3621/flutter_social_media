import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/shared_ui/bottom_navigation_bar/bloc/bottom_nav_bar_bloc.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.HOME:
              return _homeArea();
            case NavBarItem.DISCOVER:
              return _discoverArea();
            case NavBarItem.MESSAGES:
              return _messageArea();
            case NavBarItem.SETTINGS:
              return _settingArea();
          }
          return Container();
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return BottomNavigationBar(
            fixedColor: Colors.blueAccent,
            currentIndex: (snapshot.data?.index) ?? 0,
            onTap: _bottomNavBarBloc.pickItem,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Discover',
                icon: Icon(Icons.explore),
              ),
              BottomNavigationBarItem(
                label: 'Message',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _settingArea() {
  return const Center(
    child: Text("setting"),
  );
}

Widget _messageArea() {
  return const Center(
    child: Text("message"),
  );
}

Widget _discoverArea() {
  return const Center(
    child: Text("discover"),
  );
}

Widget _homeArea() {
  return const HomePage();
}
