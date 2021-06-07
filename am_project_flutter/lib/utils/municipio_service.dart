import 'package:am_project_flutter/model/municipio_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class MunicipioService {
  final String url = 'https://transparencia.tce.sp.gov.br/api/json';
  static final dio = new Dio();
  Future<List<MunicipioModel>> getMunicipios() async {
    Response response = await dio.get('$url/municipios');
    List<MunicipioModel> municipios = [];
    for (dynamic item in response.data) {
      municipios.add(
          new MunicipioModel(item['municipio'], item['municipio_extenso']));
    }
    return Future.value(municipios);
  }
}
