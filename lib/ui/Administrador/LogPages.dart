import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lobosblancos/ui/Administrador/admin_post.dart';
import 'package:lobosblancos/util/wave_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 4;
    return Scaffold(  
     
      body: Stack(
        children: [
          Container(
            height: size.height - 300,
            color: Colors.green,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 20),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 2,
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
                child: Center(
                  child:ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                     ),
                     
                    Image.asset('assets/upvt_port.jpg'),
                    const SizedBox(
                        height: 30,
                     ),
        TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(  
              hintText: 'Email',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
            ),
             onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          const SizedBox(
                        height: 20,
                     ),
          TextField(
            
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
            ),
            
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          const SizedBox(
                        height: 20,
                     ),
          RaisedButton(
            color: Colors.red,
            child: Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){
                auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminNav()));
                
                });
                
          })
       
        ]
                  )
                ),
            ),
      ),
      )
        ],),
    );
  }
}




   