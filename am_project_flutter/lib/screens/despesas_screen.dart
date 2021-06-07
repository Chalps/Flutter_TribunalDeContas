import 'package:am_project_flutter/model/municipio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NovoMunicipioScreen extends StatefulWidget {
  @override
  _NovoMunicipioScreenState createState() => _NovoMunicipioScreenState();
}

class _NovoMunicipioScreenState extends State<NovoMunicipioScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(98, 161, 228, 1),
          title: Text("Despesas",
              style: GoogleFonts.robotoSlab(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          centerTitle: true,
        ),
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/pattern.png"),
                fit: BoxFit.contain,
                repeat: ImageRepeat.repeat),
          ),
        ));
  }
}
