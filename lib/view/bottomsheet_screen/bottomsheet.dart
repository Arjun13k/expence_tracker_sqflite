import 'package:expence_tracker/view/add_screen/add_screen.dart';
import 'package:expence_tracker/view/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class BottomTabSheet extends StatefulWidget {
  const BottomTabSheet({super.key});

  @override
  State<BottomTabSheet> createState() => _BottomTabSheetState();
}

class _BottomTabSheetState extends State<BottomTabSheet> {
  int indexValue = 0;
  final listScreen = [
    HomeScreen(),
    Container(
      color: Colors.blue,
    ),
    AddScreen(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.red,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen[indexValue],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              indexValue = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: indexValue,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: Colors.white24,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.equalizer,
                  // color: Colors.white24,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  // color: Colors.white24,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  // color: Colors.white24,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  // color: Colors.white24,
                ),
                label: ""),
          ]),
    );
  }
}
