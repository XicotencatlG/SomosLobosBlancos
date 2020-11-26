
import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/TrayectoriaAcademica/Calendario_Esacolar.dart';
import 'package:lobosblancos/ui/TrayectoriaAcademica/SGCE.dart';

class TabNavItems{
  final Widget pagues;
  final Icon icon;

  TabNavItems({
    @required this.pagues,
    @required this.icon
  });

  static List<TabNavItems> get items => [
    TabNavItems(pagues: Calendario() , icon: Icon(Icons.calendar_today),),
    TabNavItems(pagues: SGCE(), icon: Icon(Icons.school)),
  ];
}