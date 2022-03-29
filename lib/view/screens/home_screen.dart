// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/view/widgets/categories_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: maxHeight(context) / 3,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: MAIN_COLOR,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Shop App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Find Your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Inspiration'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: MAIN_COLOR,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: MAIN_COLOR,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Color.fromARGB(255, 87, 74, 107),
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: CategoryItems(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
