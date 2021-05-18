import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartFood extends StatelessWidget {
  final String imageurl;
  final String name;
  final String price;
  CartFood({this.name,this.imageurl,this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Container(
                  height: MediaQuery.of(context).size.height/8,
                  width:  MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: new DecorationImage(
                      image: new NetworkImage(imageurl),
                    ),
                  ),

                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child:Text(name,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_basket,color: Color(0xFFEF2823),),
                    Text(price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}