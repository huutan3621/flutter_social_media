import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/bottom_navigation_bar/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}

///dùng int để push qua push lại các body như bottom navigation bar