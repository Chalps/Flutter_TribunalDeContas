import 'package:am_project_flutter/model/usuario_model.dart';
import 'package:am_project_flutter/repositoy/usuario_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroUsuarioScreen extends StatefulWidget {
  @override
  _CadastroUsuarioScreenState createState() => _CadastroUsuarioScreenState();
}

class _CadastroUsuarioScreenState extends State<CadastroUsuarioScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UsuarioModel usuarioModel = new UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(98, 161, 228, 1),
        title: Text("Cadastro de Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              height: 1000,
              width: 700,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/pattern.png"),
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.repeat),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.email_rounded,
                            color: Colors.black),
                        hintText: 'Digite o email para cadastrar',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o email para cadastrar';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usuarioModel.email = value;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.lock, color: Colors.black),
                        hintText: 'Senha',
                        labelText: 'Senha',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite sua senha!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usuarioModel.senha = (value);
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.person, color: Colors.black),
                        hintText: 'tipo do usuario',
                        labelText: 'Tipo Usuário',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o cargo do usuário';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usuarioModel.tipoUsuaio = (value);
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.phone, color: Colors.black),
                        hintText: 'Telefone de Contato',
                        labelText: 'Tel',
                      ),
                      validator: (value) {
                        if ((value.isEmpty)) {
                          return 'Digite um telefone para contato!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usuarioModel.tel = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(98, 161, 228, 1)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            var mensagem =
                                usuarioModel.email + ' cadastrado com sucesso!';

                            Navigator.pop(
                              context,
                              mensagem,
                            );
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Não foi possível fazer o cadastro.',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
