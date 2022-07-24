import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  int? id;
  String? name;
  String? username;
  String? email;
  int? saldo;
  String? token;
  String? telp;
  String? kecamatan;
  String? kabupaten;
  String? provinsi;
  String? alamat;
  int? kode_pos;
  String? jenis_kelamin;
  String? imageUrl;

  UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.saldo,
      required this.token,
      required this.telp,
      required this.kecamatan,
      required this.kabupaten,
      required this.provinsi,
      required this.alamat,
      required this.kode_pos,
      required this.jenis_kelamin,
      required this.imageUrl}) {}

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        saldo,
        token,
        telp,
        kecamatan,
        kabupaten,
        provinsi,
        alamat,
        kode_pos,
        jenis_kelamin,
        imageUrl
      ];
}
