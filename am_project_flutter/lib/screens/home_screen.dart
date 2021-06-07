import 'package:am_project_flutter/model/municipio_model.dart';
import 'package:am_project_flutter/utils/municipio_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  MunicipioService service = new MunicipioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Municípios',
            style: GoogleFonts.robotoSlab(
              color: Color.fromRGBO(98, 161, 228, 1),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      extendBody: true,
      key: scaffoldKey,
      body: FutureBuilder<List<MunicipioModel>>(
        future: service.getMunicipios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(98, 161, 228, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_pic2.png'),
                      radius: 45.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Profile',
                      style: GoogleFonts.robotoSlab(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .4),
                    child: Text(
                      'tipo',
                      style: GoogleFonts.robotoSlab(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Cadastro',
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(
                  '/cadastro',
                );
              },
            ),
            ListTile(
              title: Text('Login',
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(
                  '/login',
                );
              },
            ),
            ListTile(
              title: Text('Sign out',
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView(List<MunicipioModel> municipio) {
    return ListView.builder(
      itemCount: municipio == null ? 0 : municipio.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Container(
          key: Key(municipio[index].nomeMunicipio.toString()),
          child: cardMunicipio(municipio[index]),
        );
      },
    );
  }

  Card cardMunicipio(MunicipioModel municipio) {
    return Card(
      elevation: 0,
      margin: new EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(98, 161, 228, 1), width: 1),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(98, 161, 228, 1), spreadRadius: 2),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
          leading: Container(
            padding: EdgeInsets.only(right: 10),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Color.fromRGBO(20, 20, 20, 1),
                ),
              ),
            ),
            child: Icon(
              Icons.business_rounded,
              color: Colors.black,
            ),
          ),
          title: Text(municipio.nomeMunicipioExtenso,
              style: GoogleFonts.robotoSlab(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          onTap: () {
            goToDetails(context, municipio);
          },
        ),
      ),
    );
  }

  goToDetails(ctx, municipio) {
    Navigator.pushNamed(
      ctx,
      "/detalhes",
      arguments: municipio,
    );
  }
}
