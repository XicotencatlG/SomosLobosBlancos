import 'package:flutter/material.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:url_launcher/url_launcher.dart';

class RedesSociale extends StatefulWidget {
  @override
  _RedesSocialeState createState() => _RedesSocialeState();
}

class _RedesSocialeState extends State<RedesSociale> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SignInButton(buttonType: ButtonType.facebook, btnText: 'Siguenos en Facebook', onPressed: (){
                      const  url = 'https://www.facebook.com/UPValleDeToluca'; launchURL(url);
              }),
              SignInButton(buttonType: ButtonType.twitter, btnText: 'Siguenos en Twitter',onPressed: (){}),
              SignInButton(buttonType: ButtonType.youtube, btnText: 'Siguenos en Youtuve ',onPressed: (){}),
             
            ],
          ),
          ),
        ),
    );
  }
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
 }
}

