import 'package:am_project_flutter/model/municipio_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MunicipioModel municipio = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              title: Text(municipio.nomeMunicipioExtenso,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  )),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/images/tribunal.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 35, left: 60, bottom: 20, right: 60),
                  child: RaisedButton(
                    color: Colors.blueAccent[100],
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/despesas",
                      );
                    },
                    child: Text('Despesas',
                        style: GoogleFonts.robotoSlab(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 35, left: 60, bottom: 20, right: 60),
                  child: RaisedButton(
                    color: Colors.blueAccent[100],
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/receitas",
                      );
                    },
                    child: Text('Receita',
                        style: GoogleFonts.robotoSlab(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download_outlined),
        backgroundColor: Color.fromRGBO(98, 161, 228, 1),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
