import 'package:lalezar/control/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _category(),
            _main(),            
          ],
        ),
      ),
    );
  }

  // Container _footer() {
  //   return Container(
  //     padding: const EdgeInsets.all(1.0),
  //     child: Image.asset(
  //       'assets/img/header.jpg',
  //       height: 80.0,
  //     ),
  //   );
  // }

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 100.0,
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
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
  
  Container _category() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(16)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('flowers'),
              SizedBox(width: 4,),
              Icon(CupertinoIcons.sort_down),
              SizedBox(width: 8,),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _main() {
    return Expanded(
      child: Obx(() {
          if (controller.loading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.products.isEmpty) {
            return const Center(
              child: Text('check your internet...'),
            );
          }
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) => Card(
              elevation: 0.0,
              child: Container(
                height: 150,
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.products[index]["image"]),
                            fit: BoxFit.contain),
                      ),
                      margin: const EdgeInsets.all(4),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.products[index]["title"],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                controller.products[index]["description"],
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Text(
                              "\$${controller.products[index]["price"]}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
