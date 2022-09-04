import 'package:aplikasi_restaurant/detailrestaurant.dart';
import 'package:aplikasi_restaurant/listrestaurant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          colorScheme: ColorScheme.dark(),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ListRestaurant.routeName,
        routes: {
          ListRestaurant.routeName: (context) => const ListRestaurant(),
          DetailRestaurant.routeName: (context) => DetailRestaurant(
                restaurant:
                    ModalRoute.of(context)?.settings.arguments as Restaurant,
              ),
        });
  }
}

class ListRestaurant extends StatelessWidget {
  static const routeName = '/listrestaurant';
  const ListRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/listrestaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return _BuildRestaurantItem(context, restaurant[index]);
              });
        },
      ),
    );
  }
}

Widget _BuildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailRestaurant.routeName,
          arguments: restaurant);
    },
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
    leading: Expanded(
      child: Container(
        child: Image.network(
          restaurant.pictureId,
        ),
        width: 100,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.orange,
                size: 20,
              ),
              Text(restaurant.city),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(restaurant.rating.toString()),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
