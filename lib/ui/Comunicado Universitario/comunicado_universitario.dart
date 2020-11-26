import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/Comunicado%20Universitario/postCU.dart';


class ComunicadoUniversitario extends StatefulWidget {
  @override
  _ComunicadoUniversitarioState createState() => _ComunicadoUniversitarioState();
}

class _ComunicadoUniversitarioState extends State<ComunicadoUniversitario> {

  List<Post> postList = [];
 
  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("Comunicado");
    postsRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      postList.clear();

      for (var individualKey in keys) {
        Post posts = Post(
            data[individualKey]['image'],
            data[individualKey]['description'],
            data[individualKey]['date'],
            data[individualKey]['time']);

        postList.add(posts);
      }

      setState(() {
        print('Length: $postList.length');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: postList.length == 0
              ? Text("")
              : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (_, index){
                  return postsUI(
                    postList[index].image,
                    postList[index].description,
                    postList[index].date,
                    postList[index].time
                  );
                },
              ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                
              ],
            ),
          ),
        )
    );
  }
  Widget postsUI(String image, String description, String date, String time){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                  
                ),
                Text(
                  time,
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Image.network(
              image,
              fit: BoxFit.cover
            ),
            SizedBox(height: 10.0,),
            Text(
              description,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.subhead, 
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }  
}