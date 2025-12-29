import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo12_ecommerce_app/widgets/CategoriesWidget.dart';
import 'package:flutter_demo12_ecommerce_app/widgets/HomeAppBar.dart';
import 'package:flutter_demo12_ecommerce_app/widgets/ItemsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Added required super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Essential for transparency
      body: ListView(
        children: [
          const HomeAppBar(),
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                // Search bar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded( // Replaced fixed width with Expanded
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search here...',
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Color(0xFF4C53A5),
                      ),
                    ],
                  ),
                ),

                // Categories Section
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                const CategoriesWidget(),

                // Best Selling Section
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),

                const ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0, // Fixed: Added default index
        backgroundColor: Colors.transparent,
        onTap: (index) {
          // Print for debugging - replace with navigation logic
          debugPrint('Nav tab tapped: $index');
        },
        height: 70,
        color: const Color(0xFF4C53A5),
        buttonBackgroundColor: const Color(0xFF4C53A5).withOpacity(0.95),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(CupertinoIcons.cart_fill, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
