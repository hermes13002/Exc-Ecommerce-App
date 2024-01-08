// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:exc_ecomm/models/items.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final Items item;
  final void Function()? onTap;
  const ItemTile({super.key, required this.item, this.onTap});

  // List<Color> colors = [Colors.yellow, Colors.blue, Colors.green, Colors.red, Colors.purple];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
          image: DecorationImage(image: AssetImage(item.image),
          fit: BoxFit.cover)
        ),
        margin: EdgeInsets.only(left: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 170),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${item.price}', style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 14)),
                      Row(
                        children: [
                          Icon(Icons.star_rounded, color: Colors.yellow,),
                          Text(item.rating, style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
        )
      ),
    );
  }
}