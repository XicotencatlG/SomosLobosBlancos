import 'package:flutter/material.dart';

import 'package:lobosblancos/ui/Comunicado%20Universitario/carga_imagenCU.dart';
import 'package:lobosblancos/ui/CulturaDeporte/carga_imagen.dart';
import 'package:lobosblancos/ui/EspaciosCulturalesDeportivos/date.dart';
import 'package:lobosblancos/ui/Home/Home_Pagues.dart';
class AdminNav extends StatefulWidget {

  
  @override
  _AdminNavState createState() => _AdminNavState();
}

class _AdminNavState extends State<AdminNav> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
         Image.asset('assets/upvt_portadm.jpg'),
        RaisedButton(
          child: Text('Agregar nuevo comunicado cultural o deportivo', style: TextStyle(color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.green,          
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CargaImageCD()));
          },),
          RaisedButton(
          child: Text('Agregar nuevo comunicado universitario', style: TextStyle(color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.green,          
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CargaImageCU()));
          },),
          RaisedButton(
          child: Text('Agregar Administrador', style: TextStyle(color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.green,          
          onPressed: (){},),
          RaisedButton(
          child: Text('Apartados de areas ', style: TextStyle(color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.green,          
          onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => ECDView()));
          },),
       
          RaisedButton(
          child: Text('Salir ', style: TextStyle(color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.green,          
          onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          },),
      ],
              ),
            )
          ],
      ),
    );
  }
}