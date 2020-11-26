import 'package:flutter/material.dart';
import 'package:lobosblancos/util/sing_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EspaciosCulturalesDEportivos extends StatefulWidget {
  const EspaciosCulturalesDEportivos({Key key}) : super(key: key);
  @override
  _EspaciosCulturalesDEportivosState createState() =>
      _EspaciosCulturalesDEportivosState();
}

class _EspaciosCulturalesDEportivosState
    extends State<EspaciosCulturalesDEportivos> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
      // ignore: deprecated_member_use

  

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TimeOfDay _time = TimeOfDay.now();
  Future<void> choseTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != choseTime)
      setState(() {
        _time = picked;
      });
  }

  static const menuItems = <String>[
    'Auditorio Edificio A',
    'Auditorio Edificio B',
    'Canchas de futbol rapido',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _itemSelec1 = 'Canchas de futbol rapido';

  var selectVa = 1;
  onChange(value) {
    setState(() {
      selectVa = value;
    });
  }

final carreraController = TextEditingController();
final matriculaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 290),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        name,
                        
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        email,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: carreraController,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.people, color: Colors.green),
                          hintText: 'Carrera',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: matriculaController,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.people, color: Colors.green),
                          hintText: 'Matricula',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Selecione la fecha',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${_time.format(context)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () => choseTime(context),
                        child: Text(
                          'Selecione hora',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Area '),
                        trailing: DropdownButton(
                            value: _itemSelec1,
                            hint: Text('Selecione una area'),
                            onChanged: ((String newValue) {
                              setState(() {
                                _itemSelec1 = newValue;
                              });
                            }),
                            items: _dropDownMenuItems),
                      ),
                      
                      RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Guardar',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            add();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EspaciosCulturalesDEportivos()));
                          
                          }),
                         
                      
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

  
  // ignore: deprecated_member_use
  final databaseReference = Firestore.instance;



  void add(){
    databaseReference.collection('EspaciosCulturalesDeporticos').add(
      {
        'name': name,
        'correo': email,
        'Carrera': carreraController.text,
        'Matricula': matriculaController.text,
        'Fecha': selectedDate.toLocal(),
        'Hora': _time.format(context),
        'Area': _itemSelec1
      }
    ).then((value){
      // ignore: deprecated_member_use
      print(value.documentID);
    });
    
  }
  
  
    void getData(){
    databaseReference
    .collection('EspaciosCulturalesDeporticos')
    // ignore: deprecated_member_use
    .getDocuments()
    .then((QuerySnapshot snapshot) {
      // ignore: deprecated_member_use
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
  
}
