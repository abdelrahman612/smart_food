import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_food/screens/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Replace the 3 second delay with your initialization code:
        future: Future.delayed(Duration(seconds: 5)),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else {
            // Loading is done, return the app:
            return LogIn();
          }
        },
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedLogo(),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {

  double opacityLevel = 0.0;

  @override
  void initState() {
    //this code for automatically animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opacityLevel = 1;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 3),
      opacity: opacityLevel,
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width/1.25,
            height: MediaQuery.of(context).size.height/2.5,
            child: Hero(
              tag: 'logo_animation',
                child: Image.asset('images/logo.png')
            )
        ),
      ),
    );
  }
}
