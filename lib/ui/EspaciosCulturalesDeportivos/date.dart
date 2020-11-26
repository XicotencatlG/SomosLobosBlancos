import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ECDView extends StatefulWidget {
  
  @override
  _ECDViewState createState() => _ECDViewState();
}

class _ECDViewState extends State<ECDView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      body: StreamBuilder(
      // ignore: deprecated_member_use
      stream: Firestore.instance.collection('EspaciosCulturalesDeporticos').snapshots(),    
        builder: 
        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView.builder(
            
            // ignore: deprecated_member_use
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index)
            
            {
              return Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(height: 20,color: Colors.red,),
                      
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['Area'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['Carrera'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      /*Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['Fecha'],
                      ),*/
                      
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['Hora'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['Matricula'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['correo'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        // ignore: deprecated_member_use
                        snapshot.data.documents.elementAt(index)['name'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
              );
            }
          );
        }  
      ),
    );
  }
}