class MunicipioModel {
  String nomeMunicipio;
  String nomeMunicipioExtenso;

  MunicipioModel(
    this.nomeMunicipio,
    this.nomeMunicipioExtenso,
  );

  // factory MunicipioModel.fromJson(Map<String, dynamic> json) {
  //   return MunicipioModel(
  //     idMunicipio: json['municipio'],
  //     nomeMunicipio: json['municipio_extenso'],
  //   );
  // }
}
