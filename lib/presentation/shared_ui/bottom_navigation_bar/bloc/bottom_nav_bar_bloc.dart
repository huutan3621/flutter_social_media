import 'dart:async';

//an enum to represent various BottomNavigationBarItems.
enum NavBarItem { HOME, DISCOVER, MESSAGES, SETTINGS }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();
//broadcast type stream
//both body and bottomNavigationBar sections of the Scaffold listen-on the same stream to switch view based on current NavBarItem tapped.

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.DISCOVER);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.MESSAGES);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.SETTINGS);
        break;
    }
  }

  //avBarController is a private field inside the BLoC we need a handy method to close the stream from outside of the BLoC.
  void close() {
    _navBarController.close();
  }
}
