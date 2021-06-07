import 'package:am_project_flutter/model/usuario_model.dart';
import 'package:am_project_flutter/repositoy/usuario_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UsuarioModel usuarioModel = new UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(98, 161, 228, 1),
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                height: 1000,
                width: 800,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assets/images/pattern.png"),
                      fit: BoxFit.contain,
                      repeat: ImageRepeat.repeat),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: new InputDecoration(
                          icon: const Icon(Icons.email_rounded,
                              color: Colors.black),
                          hintText: 'Digite o email de login',
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o email de login válido!';
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
                          hintText: 'Digite sua senha',
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite a senha correspondente!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          usuarioModel.senha = (value);
                        },
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
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();

                              var mensagem = usuarioModel.email +
                                  'Login feito com sucesso!';

                              Navigator.pop(
                                context,
                                mensagem,
                              );
                            } else {
                              scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Não foi possível logar.',
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
        ));
  }
}
