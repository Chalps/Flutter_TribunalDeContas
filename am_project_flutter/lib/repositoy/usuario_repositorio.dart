import 'package:am_project_flutter/model/usuario_model.dart';

import 'database.dart';

class UsuarioRepositorio {
  Future<List<UsuarioModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<UsuarioModel> usuarios = new List<UsuarioModel>();

    if (db.created) {
      usuarios = new List<UsuarioModel>();

      usuarios.add(new UsuarioModel(
        id: 1,
        email: 'admin@tcesp.gov.br',
        senha: 'admin',
        tipoUsuaio: 'Admin',
        tel: '11 98362-3823',
      ));
    }
    return new Future.value(usuarios);
  }
}
