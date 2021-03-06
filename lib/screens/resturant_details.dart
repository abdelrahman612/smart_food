import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_food/custom_widgets/cart_food.dart';
import 'package:smart_food/models/resturant.dart';

class ResturantDetails extends StatelessWidget {
  final String address;
  final String description;
  final ReturnResurant resturant;
  ResturantDetails({this.resturant,this.address,this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MySliver(address: address,description: description,resturant: resturant,),
    );
  }
}

class MySliver extends StatefulWidget {
  final String address;
  final String description;
  final ReturnResurant resturant;
  MySliver({this.address,this.description,this.resturant});
  @override
  _MySliverState createState() => _MySliverState();
}

class _MySliverState extends State<MySliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: true,
                  toolbarHeight: 50,
                  expandedHeight: 300.0,
                  actions: [
                    IconButton(icon: Icon(Icons.navigate_next_outlined,size: 25,),onPressed: (){
                      Navigator.pop(context);
                    },)
                  ],
                  bottom: PreferredSize(                       // Add this code
                    preferredSize: Size.fromHeight(90.0),      // Add this code
                    child: Text(''),                           // Add this code
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Text(widget.resturant.restName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,fontWeight: FontWeight.bold
                                  ),textDirection: TextDirection.rtl,),
                            ),
                            Container(
                              child: Image.asset('images/stars.png')
                            ),
                          ],
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                            image: new NetworkImage(widget.resturant.restImg,
                            ),
                          ),
                        ),
                      ),
                  ),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90), bottomRight: Radius.circular(90))),
                ),
              ];
            },
            body: BodyInfo(address: widget.address,description: widget.description,resturant: widget.resturant,)
          ),
        ));
  }
}

class BodyInfo extends StatelessWidget {
  final String address;
  final String description;
  final ReturnResurant resturant;
  BodyInfo({this.address,this.description,this.resturant});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                child: Text(description,style:TextStyle(fontSize: 24),textDirection: TextDirection.rtl,),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(address,style:TextStyle(fontSize: 24),textDirection: TextDirection.rtl,),
                    Icon(Icons.location_on,color:Color(0xFFEF2823),),
                  ],
                ),
              ),
            ),

           ],
        )),
        Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
        Expanded(
          flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: RichText(
                    textDirection: TextDirection.rtl,
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text: '?????????? -',style: TextStyle(color: Colors.green,fontSize: 24)),
                        new TextSpan(text: '???? ${resturant.open} ??????  ${resturant.close}', style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('???????? ??????????????',style:TextStyle(fontSize: 24),textDirection: TextDirection.rtl,),
                        Icon(Icons.delivery_dining,color:Colors.grey,size: 40,),
                      ],
                    ),
                  ),
                ),

              ],
            )),
        Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
        /*Expanded(
            flex: 13,
            child:GridView.count(
              primary: false,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                CartFood(name: '?????????? ????????',imageurl: 'images/batats.png',price: '20 ??.??',),
                CartFood(name: '???????????? ?????? + ??????????',imageurl: 'images/shawarma.png',price: '20 ??.??',),
                CartFood(name: '?????????? ????????',imageurl: 'images/batats.png',price: '20 ??.??',),
                CartFood(name: '???????????? ?????? + ??????????',imageurl: 'images/shawarma.png',price: '20 ??.??',),
                CartFood(name: '?????????? ????????',imageurl: 'images/batats.png',price: '20 ??.??',),
                CartFood(name: '???????????? ?????? + ??????????',imageurl: 'images/shawarma.png',price: '20 ??.??',),
                CartFood(name: '?????????? ????????',imageurl: 'images/batats.png',price: '20 ??.??',),
                CartFood(name: '???????????? ?????? + ??????????',imageurl: 'images/shawarma.png',price: '20 ??.??',),
              ],
            )
        ),*/
        Expanded(
            flex: 13,
            child:GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
              itemCount: resturant.products.length,
              itemBuilder: (context,index){
                return CartFood(
                  name:resturant.products[index].prodName,
                  imageurl:resturant.products[index].prodImage,
                  price: ' ${resturant.products[index].prodPrice} ??.??  ',
                );
              },
              primary: false,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            )
        ),
      ],
    );
  }
}

var text = new RichText(
  textDirection: TextDirection.rtl,
  text: new TextSpan(
    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: new TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    children: <TextSpan>[
        new TextSpan(text: '?????????? -',style: TextStyle(color: Colors.green,fontSize: 24)),
      new TextSpan(text: '???? 10 ?? ?????? 10 ??', style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    ],
  ),
);



