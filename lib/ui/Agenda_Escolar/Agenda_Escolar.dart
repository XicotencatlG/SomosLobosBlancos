import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
class Agenda extends StatefulWidget {
  
  @override
  _AgendaState createState() => _AgendaState();
}
class _AgendaState extends State<Agenda> {
  //String url = 'http://upvt.edomex.gob.mx/sites/upvt.edomex.gob.mx/files/files/CALENDARIO%20ESCOLAR%202020.pdf';
  String pdfassets = 'assets/upvtAgenda.pdf';
  PDFDocument _doc;
  bool _loading;
  @override
  void initState() { 
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfassets);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
       showIndicator: true,
       showPicker: false,
       ),
    );
  }
}