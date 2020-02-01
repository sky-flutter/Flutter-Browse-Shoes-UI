import 'package:flutter/material.dart';

class ShoesModel{
  Color colorStart,colorEnd;
  String price;
  String title,desc;
  String imagePath;
  String wishlist;

  ShoesModel(this.colorStart, this.colorEnd,this.price, this.title,
      this.desc, this.imagePath, this.wishlist);

}
class ListOfData{
  var listShoes = List<ShoesModel>();
  addValue(){
    listShoes.add(ShoesModel(Color(0xff6F00FE), Color(0xffF72648), "120", "ARIBORNE 19", "This is sample data\nof shoes", "assets/ic_page_1.png", "Simple Data"));
    listShoes.add(ShoesModel(Color(0xff4054FF), Color(0xff00E8CA), "140", "ARIBORNE 20", "This is sample data\nof shoes", "assets/ic_page_2.png", "Simple Data"));
    listShoes.add(ShoesModel(Color(0xffFFBA00), Color(0xff40A1FF), "129", "ARIBORNE 21", "This is sample data\nof shoes", "assets/ic_page_3.png", "Simple Data"));
  }
}