import 'package:exc_ecomm/models/items.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  final List<Items> _itemsMenu = [
    Items(name: "Sweater", 
      price: "20.00", 
      image: "assets/images/cardigan/c3.png", 
      rating: "4.7"
    ),
    Items(name: "White Hoodie", 
      price: "25.00", 
      image: "assets/images/cardigan/c4.png", 
      rating: "4.9"
    ),
    Items(name: "Brown Shoe", 
      price: "10.00", 
      image: "assets/images/shoes/shoe1.png", 
      rating: "4.5"
    ),
    Items(name: "Nike Shoe", 
      price: "21.00", 
      image: "assets/images/shoes/shoe3.png", 
      rating: "4.7"
    ),
  ];

  // Customer cart
  List<Items> _cart = [];

  // getter methods
  List<Items> get itemsMenu => _itemsMenu;
  List<Items> get cart => _cart;

  // add to cart
  void addToCart(Items shopItem, int quantity) {
    for (int i = 0; i < quantity; i++){
      _cart.add(shopItem); 
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Items items){
    _cart.remove(items);
    notifyListeners();

  }  

}