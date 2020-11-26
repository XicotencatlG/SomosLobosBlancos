import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/Administrador/admin_post.dart';
import 'package:lobosblancos/util/wave_widget.dart';


class AdminPague extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 4;
    return Scaffold(
      backgroundColor: Colors.white,
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 80,
                      ),
                    Image.asset('assets/upvt_port.jpg'),
                  const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail, color: Colors.white),
                    hintText: 'Correo',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.red,),
                    hintText: 'Password' ,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                //  elevation: 20,
                  splashColor: Colors.lime,
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text('Iniciar'),
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNav()));
                  } ,
                  ),
                   
                    ],
                  
                  ),
                  ),
              ),
            ),
            ),
        ],
        
      ),
      
    );
  }
}