import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_food/custom_widgets/card_type.dart';
import 'package:smart_food/models/categories.dart';
import 'package:smart_food/models/resturant.dart';
import 'package:smart_food/screens/resturant_details.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:  MyAppBar((){
        setState(() {
          _scaffoldKey.currentState.openEndDrawer();
        });
      }),
      endDrawer: Drawer() ,
      body: TheBody(),

    );
  }
}

class TheBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////////////////////
        SizedBox(
          height: 15,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Text('مرحبأ',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28)
                ,textDirection: TextDirection.rtl,),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            ),
            Container(
              child: Text('عن ماذا تبحث؟',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28)
                ,textDirection: TextDirection.rtl,),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            ),
          ],
        ),
        ),
        /////////////////
        /*Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration:BoxDecoration(
                      color: Color(0xFFEF2823),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Text('الجميع',style: TextStyle(fontSize: 24,color: Colors.white),textDirection: TextDirection.rtl,),
                ),
              ),
              categorie(name: 'اسماك',),
              categorie(name: 'مشويات',),
              categorie(name: 'جديد',),
              categorie(name: 'أخرى',),
            ],
          ),
        ),*/
        Expanded(
            flex: 2,
            child: CategoriesList()),
        /////////////////
        /*Expanded(
          flex: 10,
          child: ListView(
            children: [
              Directionality(
                child: CardType(
                  imageurl: 'images/ahl_elsham.png',
                  resturant_name: 'أهل الشام',
                  description: 'شاورما_شندوتشات_وجبات سريعة',
                  address: 'المنصورة-شارع الترعة- 2 ك.م ',
                  avaliblity: 'متاح التوصيل',
                ),
                textDirection: TextDirection.rtl,
              ),
              Directionality(
                child: CardType(
                  imageurl: 'images/wild_burger.png',
                  resturant_name: 'wild burger',
                  description: 'برجر _ سندوتشات _وجبات سريعة',
                  address: 'المنصورة-شارع الترعة- 2 ك.م ',
                  avaliblity: 'متاح التوصيل',
                ),
                textDirection: TextDirection.rtl,
              ),
              Directionality(
                child: CardType(
                  imageurl: 'images/pizza_hot.png',
                  resturant_name: 'pizza hot',
                  description: 'بيتزا _ سندوتشات _وجبات سريعة',
                  address: 'المنصورة-شارع الترعة- 2 ك.م ',
                  avaliblity: 'متاح التوصيل',
                ),
                textDirection: TextDirection.rtl,
              ),
              Directionality(
                child: CardType(
                  imageurl: 'images/nola.png',
                  resturant_name: 'nola',
                  description: 'حلويات',
                  address: 'المنصورة-شارع الترعة- 2 ك.م ',
                  avaliblity: 'متاح التوصيل',
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),*/
        ////////////////
        Expanded(
          flex: 10,
          child: ResturantList(),
        ),
      ],
    );
  }
}



class categorie extends StatelessWidget {
  final String name;
  categorie({this.name});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color:Color(0xFFEF2823))
        ),
        child: Text(name,style: TextStyle(fontSize: 24,color:Color(0xFFEF2823)),textDirection: TextDirection.rtl,),
      ),
    );
  }
}

AppBar MyAppBar( Function function){

  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Color(0xFFffc501),
    automaticallyImplyLeading: false, // this will hide Drawer hamburger icon
    actions: <Widget>[Container()],   // this will hide endDrawer hamburger icon
    bottom: PreferredSize(
        child: ListTile(
          leading:IconButton(icon: Icon(Icons.search , color: Colors.black,size: 30,),onPressed: (){},),
          title: Center(
            child: Text(
              'الرئيسية',
              style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
          ),
          trailing: IconButton(icon: Icon(Icons.menu,color: Colors.black,size: 30,),onPressed:function),
        ),
        preferredSize: Size.fromHeight(50.0)
    ),
    shape:  ContinuousRectangleBorder(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(70.0),
        bottomLeft: Radius.circular(70.0),
      ),),
  );
}

/*Future<List<Return>> getCategories()async{
  final response = await http.get(Uri.parse('http://otlob.accuragroup-eg.net/api/getCategories'));
  Categories c = categoriesFromJson(response.body);
  List<Return> r = c.categoriesReturn;
  return r;
}*/

//handle categories
class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  Future<Categories> fetch_categories;
  bool added;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_categories = fetchCategories();
    added = false;
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Categories>(
      future: fetch_categories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var my_list_return = snapshot.data.categoriesReturn;
          if(!added) {
            my_list_return.insert(0,Return(id: 5,name: 'الجميع'));
            added = true;
          }
          return ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: my_list_return.length,
            itemBuilder: (context,index){
              if (my_list_return[index].name !='الجميع') {
                return categorie(name: my_list_return[index].name,);
              }
              else{
                return Customcategories();
              }
            }
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator(
          backgroundColor: Color(0xFFffc501),
        );
      },
    );
}
}

Future<Categories> fetchCategories() async {
  final response = await http.get(Uri.parse('http://otlob.accuragroup-eg.net/api/getCategories'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Categories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Customcategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration:BoxDecoration(
            color: Color(0xFFEF2823),
            borderRadius: BorderRadius.circular(25)
        ),
        child: Text('الجميع',style: TextStyle(fontSize: 24,color: Colors.white),textDirection: TextDirection.rtl,),
      ),
    );
  }
}
//end handle categories
//////////////////////////////////////////////////////////////////////////////////////////////
//handle resturant
Future<Resturant> fetchResturant() async {
  final response = await http.get(Uri.parse('http://otlob.accuragroup-eg.net/api/getResturants?langu=ar&catId'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Resturant.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ResturantList extends StatefulWidget {
  @override
  _ResturantListState createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  Future<Resturant> fetch_resturant;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_resturant = fetchResturant();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Resturant>(
      future: fetch_resturant,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var my_list_return = snapshot.data.resturantReturn;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: my_list_return.length,
              itemBuilder: (context,index){
                  return CardType(
                    imageurl: my_list_return[index].restImg,
                    description:my_list_return[index].restType ,
                    address:'المنصورة-شارع الترعة- 2 ك.م' ,
                    avaliblity: ' متاح${my_list_return[index].open} الى ${my_list_return[index].close}',
                    resturant_name: my_list_return[index].restName,
                    resturant:my_list_return[index],
                  );
              }
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Container();
      },
    );
  }
}

//end handle resturant

