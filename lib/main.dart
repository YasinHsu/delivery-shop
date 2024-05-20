import 'package:flutter/material.dart';
import 'package:lalezar/home.dart';
import 'package:lalezar/map.dart';
import 'package:lalezar/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'laleZar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 150, 80, 80)),
        useMaterial3: true,
      ),
      home: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int myIndex = 1;
  List<Widget> widgetlist = [
    const ProfileScreen(),
    const HomeScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text('LaleZar Delivery App'),),
      body: Center(child: widgetlist[myIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
          });
          myIndex = index;
        },
        iconSize: 28,
        
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: myIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.location_pin),
        label: 'Map'),
      ])
    );
  }
}