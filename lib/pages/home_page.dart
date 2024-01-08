// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:provider/provider.dart';
import 'package:exc_ecomm/components/item_tile.dart';
import 'package:exc_ecomm/models/shop.dart';
import 'package:exc_ecomm/pages/item_details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  // items menu list
  // List itemsMenu = [
  //   Items(name: "Gucci", 
  //     price: "20.00", 
  //     image: "assets/images/cardigan/c1.png", 
  //     rating: "4.7"
  //   ),
  //   Items(name: "Balenciaga", 
  //     price: "25.00", 
  //     image: "assets/images/shirt/s1.png", 
  //     rating: "4.9"
  //   ),
  //   Items(name: "", 
  //     price: "10.00", 
  //     image: "assets/images/shoes/shoe1.png", 
  //     rating: "4.5"
  //   ),
  //   Items(name: "Nike Shoe", 
  //     price: "21.00", 
  //     image: "assets/images/shoes/shoe3.png", 
  //     rating: "4.7"
  //   ),
  // ];


  void navToDetailsPage(int index) {
    final shop = context.read<Shop>();
    final itemsMenu = shop.itemsMenu;

    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => ItemDetailsPage(
        items: itemsMenu[index],
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final itemsMenu = shop.itemsMenu;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Excelsior Shop", style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w100, fontSize: 22, color: Colors.blue)),
        centerTitle: true,
        // leading: Icon(Icons.menu,),
        actions: [
          IconButton(
            onPressed: () {Navigator.pushNamed(context, '/cartpage');},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 7,),
      
          Row(
            children: [
              SizedBox(width: 20,),
      
              // search product
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0,),
                child: SizedBox(
                  width: 340,
                  child: TextField(
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                      labelText: 'Search Your Product',
                      labelStyle: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                      icon: Icon(Icons.search_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
      
          // Categories section
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 20,),
                    Text('Categories', 
                      style: TextStyle(
                        fontFamily: 'Poppins-Bold', 
                        fontWeight: FontWeight.w600, 
                        fontSize: 20,
                        
                      ),),
                    Text("See All", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 20, color: Colors.blue),)
                  ],
                ),
              ),
              SizedBox(height: 5,),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 170,
                          height: 130,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow,
                              image: DecorationImage(image: AssetImage('assets/images/cardigan/c2.png'),
                              fit: BoxFit.cover)
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Text(
                                  'Cardigans', 
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21,
                                    foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.black
                                  ),  
                                ),
                                Text('Cardigans',
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21, color: Colors.white
                                  ),
                                )
                                ]
                              )
                            ),
                          )
                        ),
                        SizedBox(width: 10,),
                
                        SizedBox(
                          width: 170,
                          height: 130,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                              image: DecorationImage(image: AssetImage('assets/images/shirt/s2.png'),
                              fit: BoxFit.cover)
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Text(
                                  'Shirts', 
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21,
                                    foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.black
                                  ),  
                                ),
                                Text('Shirts',
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21, color: Colors.white
                                  ),
                                )
                                ]
                              )
                            ),
                          )
                        ),  
                        SizedBox(width: 10,),
                
                        SizedBox(
                          width: 170,
                          height: 130,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                              image: DecorationImage(image: AssetImage('assets/images/shoes/shoe4.png'),
                              fit: BoxFit.cover,)
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Text(
                                  'Shoes', 
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21,
                                    foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.black
                                  ),  
                                ),
                                Text('Shoes',
                                  style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 21, color: Colors.white
                                  ),
                                )
                                ]
                              )
                            ),
                          )
                        ),  
                        SizedBox(width: 10,),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
          SizedBox(height: 15,),
      
      
          // Featured section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(width: 20,),
                Text('Featured', style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 20,),),
                Text("See All", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 20, color: Colors.blue),)
              ],
            ),
          ),
          SizedBox(height: 5,),
      
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemsMenu.length,
              itemBuilder: (content, index) => ItemTile(
                item: itemsMenu[index],
                onTap: () {
                  navToDetailsPage(index);
      
                }
              )
            ),
          ),
      
          SizedBox(height: 15,),
      
          // Others section
          Column(
            children: [
              Padding( 
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Others', style: TextStyle(fontFamily: 'Poppins-Bold', fontWeight: FontWeight.w600, fontSize: 20,),),
                    Text("See All", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 20, color: Colors.blue),)
                  ],
                ),
              ),
              SizedBox(height: 7,),
      
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                padding: EdgeInsets.all(20),
      
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/cardigan/c1.png",
                          height: 60,
                        ),
                        SizedBox(width: 20,),
      
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Leather Jacket",
                                style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                          
                              Text(
                                "\$21.00",
                                style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.grey[900],)
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.grey[600],
                      size: 20,
                    )
                  ],
                ),
              ),
      
      
              SizedBox(height: 15,),
            ]
          ),
        ],
      ),
    );
  }
}