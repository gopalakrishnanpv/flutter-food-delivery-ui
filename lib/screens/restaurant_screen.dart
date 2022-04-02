import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widgets/rounded_icon_button.dart';

import '../models/food.dart';
import '../models/restaurant.dart';
import '../widgets/rating.dart';
import '../widgets/rounded_text_button.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.restaurant.name.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.my_location),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          '0.2 Miles',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                Rating(
                  rating: widget.restaurant.rating,
                  size: 18.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.restaurant.address,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12.0),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Expanded(
                      child: RoundedTextButton(
                          text: 'Reviews', padding: 20.0, borderRadius: 10.0),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: RoundedTextButton(
                          text: 'Contact', padding: 20.0, borderRadius: 10.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: Text(
              'MENU',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  letterSpacing: 1.2),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuItem(Food food) {
  return Stack(alignment: Alignment.center, children: [
    Container(
      margin: const EdgeInsets.all(10.0),
      constraints: const BoxConstraints(
          minWidth: 150.0, minHeight: 150.0, maxWidth: 500.0, maxHeight: 500.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(food.imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.0)),
    ),
    Container(
      margin: const EdgeInsets.all(10.0),
      constraints: const BoxConstraints(
          minWidth: 150.0, minHeight: 150.0, maxWidth: 500.0, maxHeight: 500.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black87.withOpacity(0.5),
              Colors.black54.withOpacity(0.5),
              Colors.black38.withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(15.0)),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          food.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
        ),
        Text(
          food.price.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.white),
        )
      ],
    ),
    const Positioned(
      right: 10.0,
      bottom: 10.0,
      child: CircularIconButton(
        icon: Icons.add,
        size: 48.0,
        margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
      ),
    )
  ]);
}
