import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalezar/screen/home.dart';
import 'package:lalezar/screen/map.dart';
import 'package:lalezar/screen/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'laleZar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 130, 30, 30)),
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
    HomeScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Container(
                  height: 100,
                  color: Colors.grey[400],
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Container(
                  height: 100,
                  color: Colors.grey[500],
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Container(
                  height: 100,
                  color: Colors.grey[600],
                  margin: const EdgeInsets.only(bottom: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Delivery App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.shopping_cart,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
      body: Center(child: widgetlist[myIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {});
          myIndex = index;
        },
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: 'Map'),
        ],
      ),
    );
  }
}
