import 'package:finance_tracker/screens/home/views/main_screen.dart';
import 'package:finance_tracker/screens/stats/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  var screens = const [
    MainScreen(),
    StatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.graph_square_fill),
              label: 'Stats',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(
            CupertinoIcons.add,
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
