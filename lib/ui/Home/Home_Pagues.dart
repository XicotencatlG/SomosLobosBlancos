import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/Administrador/LogPages.dart';

import 'package:lobosblancos/ui/Agenda_Escolar/Agenda_Escolar.dart';
import 'package:lobosblancos/ui/Comunicado%20Universitario/comunicado_universitario.dart';
import 'package:lobosblancos/ui/CulturaDeporte/cultura_deporte_page.dart';
import 'package:lobosblancos/ui/EspaciosCulturalesDeportivos/EspaciosCulturalesDeportivos.dart';
import 'package:lobosblancos/ui/Login/Login_Pagues.dart';
import 'package:lobosblancos/ui/RedesSociales/RedesSociales.dart';
import 'package:lobosblancos/ui/SplashCreen/SplashCreen_Pagues.dart';
import 'package:lobosblancos/ui/TrayectoriaAcademica/estacionamiento_pages.dart';
import 'package:lobosblancos/util/sing_in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _select = 2;
  _getDrawerItemWidget(int mostrar) {
    switch (mostrar) {
      case 0:
        return SplashCreen();
      case 1:
        return TrayectoriAcademica();
      case 2:
        return CulturaDeporte();
      case 3:
        return Agenda();
      case 4:
        return ComunicadoUniversitario();
      case 5:
        return EspaciosCulturalesDEportivos();
      case 6:
        return LoginScreen();
      case 7:
        return RedesSociale();
    }
  }

  _onSelect(int mostrar) {
    setState(() {
      Navigator.of(context).pop();
      _select = mostrar;
    });
  }

void _singOut(){
  FirebaseAuth.instance.signOut();
  // ignore: deprecated_member_use
  runApp(new MaterialApp(home: LoginPage()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, actions: <Widget>[]),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name),
            decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/upvt_portada.jpg'), fit: BoxFit.cover),
            ),
            accountEmail: Text( 
              email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.white,
            )),
          ),
          
          ListTile(
            leading: Icon(Icons.school),
            selected: (0 == _select),
            title: Text('Trayectoria Academica',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            onTap: () {
              _onSelect(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            selected: (0 == _select),
            title: Text(
              'Cultura y Deporte',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _onSelect(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            selected: (0 == _select),
            title: Text(
              'Agenda Escolar',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _onSelect(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            selected: (0 == _select),
            title: Text(
              'Comunicado Universitario',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _onSelect(4);
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_people),
            selected: (0 == _select),
            title: Text(
              'Espacios Culturales y Deportivos',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _onSelect(5);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.link,
            ),
            selected: (0 == _select),
            title: Text(
              'Redes Sociales',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _onSelect(7);
            },
          ),
          Divider(color: Colors.yellow),
          SizedBox(
            height: 20,
          ),
          
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            selected: (0 == _select),
            title: Text(
              'Administrador',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            
            onTap: () {
              _onSelect(6);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            selected: (0 == _select),
            title: Text(
              'Salir',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            onTap: () {
              _singOut();
            },
          ),
          
        ]),
      ),
      body: _getDrawerItemWidget(_select),
    );
  }
}
