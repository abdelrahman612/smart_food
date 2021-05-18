import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_food/models/resturant.dart';
import 'package:smart_food/screens/resturant_details.dart';

class CardType extends StatelessWidget {
  final String imageurl;
  final String resturant_name;
  final String description;
  final String address;
  final String avaliblity;
  final ReturnResurant resturant;

  CardType({
    this.imageurl,
    this.resturant_name,
    this.description,
    this.address,
    this.avaliblity,
    this.resturant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (contest)=>ResturantDetails(address: address,description: description,resturant:resturant,)));
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Card(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(resturant_name,style: TextStyle(fontSize: 28),textDirection: TextDirection.rtl,),
                      ),
                      Container(
                        child: Image.asset('images/stars.png'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(description,style: TextStyle(fontSize: 17),textDirection: TextDirection.rtl,),
                      ),
                      Container(
                          child:Row(
                            children: [
                              Icon(Icons.location_on,color: Colors.grey,),
                              Text(address,style: TextStyle(fontSize: 17),textDirection: TextDirection.rtl,),
                            ],
                          )
                      ),
                      Container(
                          child:Row(
                            children: [
                              Icon(Icons.electric_rickshaw_rounded,color: Colors.grey,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(avaliblity,style: TextStyle(fontSize: 17),textDirection: TextDirection.rtl,),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}