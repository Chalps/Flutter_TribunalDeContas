import 'dart:convert';

import 'package:am_project_flutter/screens/receita_screen.dart';
import 'package:am_project_flutter/screens/cadastro_screen.dart';
import 'package:am_project_flutter/screens/details_screen.dart';
import 'package:am_project_flutter/screens/home_screen.dart';
import 'package:am_project_flutter/screens/login_screen.dart';
import 'package:am_project_flutter/screens/despesas_screen.dart';
import 'package:am_project_flutter/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/municipio_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<List<MunicipioModel>> products;
  MyApp({Key key, this.products}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/detalhes': (context) => DetalhesScreen(),
        '/cadastro': (context) => CadastroUsuarioScreen(),
        '/login': (context) => LoginScreen(),
        '/despesas': (context) => NovoMunicipioScreen(),
        '/receitas': (context) => AlterarMunicipioScreen()
      },
      title: 'TCESP',
      theme: new ThemeData(
        buttonColor: Color.fromRGBO(98, 161, 228, 1),
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(98, 161, 228, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
