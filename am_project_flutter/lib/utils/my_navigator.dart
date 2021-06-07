import 'package:am_project_flutter/model/municipio_model.dart';
import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToDetails(
      BuildContext context, MunicipioModel municipio) async {
    Navigator.pushNamed(context, "/detalhes", arguments: municipio);
  }

  static void goToNewCadastro(
    BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      "/cadastro",
    );
  }

  static void goToLogin(
    BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      "/login",
    );
  }

  static void goToNewMunicipio(
    BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      "/despesas",
    );
  }

  static void goToChangeMunicipio(
    BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      "/receitas",
    );
  }
}
