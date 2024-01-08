// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exc_ecomm/models/items.dart';
import 'package:exc_ecomm/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItem(Items items, BuildContext context){
    // get access to shop
    final shop = context.read<Shop>();
    // remove from cart
    shop.removeFromCart(items);
  }

    @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white),),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                // get food from cart
                final Items items = value.cart[index];
            
                // get food name
                final String itemName = items.name;
            
                // get food price
                final String itemPrice = items.price;

                // get food price
                final String itemImage = items.image;
                
                // return list tile
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    tileColor: Colors.grey[300],
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(itemImage),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(itemName, style: TextStyle(fontFamily: 'Poppins-Bold',),),
                    subtitle: Text('\$$itemPrice', style: TextStyle(fontFamily: 'Poppins',),),
                    trailing: IconButton(
                      onPressed: (){
                        removeItem(items, context);
                      }, 
                      icon: const Icon(Icons.delete)
                      ),
                  ),
                );
              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pay Now',
                      style: TextStyle(
                        fontFamily: 'Poppins-Bold',
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.payments, color: Colors.white,)
                  ],
                ),
              ),
            )
          )
        ],
      ),

      
    ));
  }
}