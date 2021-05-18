import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_food/models/admin.dart';

class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _form = GlobalKey<FormState>(); //for storing form state.

  bool _visible = true;
  bool founded = false;
  final List<Admin> a = [
    Admin(phonenumper: '0123456789',password: '123000'),
    Admin(phonenumper: '0103456789',password: '456000'),
    Admin(phonenumper: '0113456789',password: '789000'),
    Admin(phonenumper: '0153456789',password: '111000'),
    Admin(phonenumper: '01002508458',password: '123456'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _form,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,50,0,0),
                child: Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: MediaQuery.of(context).size.height/3,
                    child: Hero(
                        tag: 'logo_animation',
                        child: Image.asset('images/logo.png'),
                    )
                ),
              ),
              SizedBox(
                height:20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text('تسجيل الدخول',style: TextStyle(fontSize: 28,fontWeight:FontWeight.w900 ),textDirection: TextDirection.rtl,),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffebf1cc),
                ),
               margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    validator: (text){
                      if(text==''){
                        return "من فضلك ادخل رقم الهاتف";
                      }
                      return null;
                    },
                    textDirection: TextDirection.rtl,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'رقم الهاتف',
                      labelStyle: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffebf1cc),
                ),
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    validator: (text){
                      if(text==''){
                        return 'من فضلك ادخل الرقم السرى ';
                      }else {
                        if (text.length < 6) {
                          return 'يجب ان يكون اكبر من 6 احرف او ارقام';
                        }
                        else {
                          return null;
                        }
                      }
                    },
                    textDirection: TextDirection.rtl,
                    obscureText: _visible?true:false,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'كلمه المرور',
                      labelStyle: TextStyle(fontSize: 24),
                      suffixIcon: IconButton(
                        icon: _visible?Icon(Icons.visibility_off):Icon(Icons.visibility),
                        onPressed: (){
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    final isValid = _form.currentState.validate();
                    if (!isValid) {
                      return;
                    }
                    //print(nameController.text);
                    //print(passwordController.text);

                    for(int i=0;i<a.length;i++){
                      print(a[i].phonenumper);
                      //
                      if(a[i].password==passwordController.text &&
                      a[i].phonenumper==nameController.text){
                        print('done');
                        Navigator.pushNamed(context, '/Home');
                        founded=true;
                      }
                    }
                    if(!founded){
                      final snackBar = SnackBar(content: Text('عذرا فرقم الهاتف او الباسورد غير صحيح '));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffAEC632),
                    ),
                    child: Text('دخول',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 24,color:
                    Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

