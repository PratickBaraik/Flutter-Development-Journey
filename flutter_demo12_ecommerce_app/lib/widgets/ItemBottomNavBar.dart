import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3, blurRadius: 10, offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$120",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(CupertinoIcons.cart_badge_plus),
                label: Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  // ignore: deprecated_member_use
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF4C53A5),
                  ),
                  iconColor: WidgetStatePropertyAll(Colors.white),
                  // ignore: deprecated_member_use
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 13,
                      horizontal: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
