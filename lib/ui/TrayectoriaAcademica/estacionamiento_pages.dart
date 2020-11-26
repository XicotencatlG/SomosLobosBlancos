
import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/TrayectoriaAcademica/Calendario_Esacolar.dart';
import 'package:lobosblancos/ui/TrayectoriaAcademica/SGCE.dart';




class TrayectoriAcademica extends StatefulWidget {
  @override
  _TrayectoriAcademicaState createState() => _TrayectoriAcademicaState();
}

class _TrayectoriAcademicaState extends State<TrayectoriAcademica> {
   int _currentIndex = 0;
  final List<Widget> _children = [
    
    
    Calendario(),
    SGCE(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapTapped,
        backgroundColor: Colors.green,
        fixedColor: Colors.white,
        items: <BottomNavigationBarItem>[
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Calendario Escolar'),),
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('SGCE'))
        ],
      ),
    );
  }
  void onTapTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}