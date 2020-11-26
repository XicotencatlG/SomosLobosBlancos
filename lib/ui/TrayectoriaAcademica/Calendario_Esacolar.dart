import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
class Calendario extends StatefulWidget {
  
  @override
  _CalendarioState createState() => _CalendarioState();
}
class _CalendarioState extends State<Calendario> {
  String url = 'http://upvt.edomex.gob.mx/sites/upvt.edomex.gob.mx/files/files/CALENDARIO%20ESCOLAR%202020.pdf';
  String pdfassets = 'assets/CALENDARIO ESCOLAR 2020.pdf';
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
    final doc = await PDFDocument.fromURL(url);
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
       showIndicator: false,
       showPicker: false,
       ),
    );
  }
}