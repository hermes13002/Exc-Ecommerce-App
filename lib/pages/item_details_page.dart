// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exc_ecomm/models/items.dart';
import 'package:exc_ecomm/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailsPage extends StatefulWidget {
  final Items items;
  const ItemDetailsPage({super.key, required this.items});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity(){
    setState(() {
      if (quantityCount > 0){
         quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  void addToCart(){
    // only add to cart if there is something in the cart
    if (quantityCount > 0){
      //get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.items, quantityCount);

      // let user know adding was successful
      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (context) => AlertDialog(
          content: Text("Successfully added to cart"),
          actions: [
            IconButton(
              onPressed: (){
                // pop once to remove dialog box
                Navigator.pop(context);
                // pop again to go to previous screen
                Navigator.pop(context);
                }, 
              icon: Icon(Icons.done),
            )
          ],
        )
      );
    }else{
      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (context) => AlertDialog(
          content: Text("Increase number of items first"),
          actions: [
            IconButton(
              onPressed: (){
                // pop once to remove dialog box
                Navigator.pop(context);
                }, 
              icon: Icon(Icons.done),
            )
          ],
        )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.blue),),
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.items.image,
                    height: 200,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.yellow,),
                      const SizedBox(width: 5,),
              
                      Text(
                        widget.items.rating,
                        style: TextStyle(
                          fontFamily: 'Poppins-Bold',
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      )
                    ],
                  ),
              
                  const SizedBox(height: 10,),

                  Text(
                    widget.items.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),

                  SizedBox(height: 18,),
              
                  Text(
                    "Description",
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
              
                  const SizedBox(height: 5,),
              
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey[900],
                      fontSize: 16,
                      height: 1.5
                    ),
                  ),
              
                  
              
                ],
              ),
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${widget.items.price}",
                      style: TextStyle(
                        fontFamily: 'Poppins-Bold', 
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(onPressed: decrementQuantity, 
                          icon: Icon(Icons.remove),
                          color: Colors.white,
                          ),
                      ),
      
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins-Bold', 
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          onPressed: incrementQuantity, 
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          ),
                      )
                    ],)
                  ],
                ),
      
                SizedBox(height: 25,),
      
                GestureDetector(
                  onTap: addToCart,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to Cart',
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart_checkout, color: Colors.white, size: 30,)
                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
