import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            'assets/img/logo.jpg',
            height: 100.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 200.0,
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Text(
                            'text $i',
                          ));
                    },
                  );
                }).toList(),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 300.0,
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Text(
                            'text $i',
                          ));
                    },
                  );
                }).toList(),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 300.0,
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Text(
                            'text $i',
                          ));
                    },
                  );
                }).toList(),
              )),
        ),
      ])),
    );
  }
}
