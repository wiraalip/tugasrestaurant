import 'package:aplikasi_restaurant/listrestaurant.dart';
import 'package:aplikasi_restaurant/main.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;
  const DetailRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                restaurant.name,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.orange,
                    size: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      restaurant.city,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      restaurant.rating.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                height: 340,
                width: 340,
                child: Text(
                  restaurant.description,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.menus.drinks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(restaurant.menus.drinks[index].name),
                        );
                      }),
                ),
                Container(
                  width: 100,
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.menus.foods.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            restaurant.menus.foods[index].name,
                            style: TextStyle(),
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
