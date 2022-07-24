import 'dart:convert';
import 'dart:io';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String baseUrl = 'http://192.168.43.44:8080/api';
  //String baseUrl = 'http://50.50.50.198:8080/api';

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    var url = Uri.parse('${baseUrl}/login');
    var header = {'Content-type': 'application/json'};
    var data = jsonEncode({'email': email, 'password': password});

    var response = await http.post(url, headers: header, body: data);
    print(response.body);

    var id = jsonDecode(response.body)['data']['id'];
    var nama = jsonDecode(response.body)['data']['name'];
    var username = jsonDecode(response.body)['data']['username'];
    var emailJson = jsonDecode(response.body)['data']['email'];
    var saldo = jsonDecode(response.body)['data']['saldo'];
    var token = jsonDecode(response.body)['token'];
    var telp = jsonDecode(response.body)['data']['telp'];
    var kecamatan = jsonDecode(response.body)['data']['kecamatan'];
    var kabupaten = jsonDecode(response.body)['data']['kabupaten'];
    var provinsi = jsonDecode(response.body)['data']['provinsi'];
    var alamat = jsonDecode(response.body)['data']['alamat'];
    var kode_pos = jsonDecode(response.body)['data']['kode_pos'];
    var jenis_kelamin = jsonDecode(response.body)['data']['jenis_kelamin'];
    var imageUrl = jsonDecode(response.body)['data']['imageUrl'];

    UserModel user = UserModel(
        id: id,
        email: emailJson,
        name: nama,
        username: username,
        saldo: saldo,
        token: token,
        telp: telp,
        kecamatan: kecamatan,
        kabupaten: kabupaten,
        provinsi: provinsi,
        alamat: alamat,
        kode_pos: kode_pos,
        jenis_kelamin: jenis_kelamin,
        imageUrl: imageUrl);

    return user;
  }

  Future<UserModel> signUp(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse('http://192.168.43.44:8080/api/register');
    var header = {'Content-type': 'application/json'};
    var data = jsonEncode({
      'email': email,
      'password': password,
      'name': name,
      'username': username
    });

    var response = await http.post(url, headers: header, body: data);

    print('berhasil login');

    var id = jsonDecode(response.body)['data']['id'];
    var nama = jsonDecode(response.body)['data']['name'];
    var usernameJson = jsonDecode(response.body)['data']['username'];
    var emailJson = jsonDecode(response.body)['data']['email'];
    var saldo = jsonDecode(response.body)['data']['saldo'];
    var token = jsonDecode(response.body)['token'];
    var telp = jsonDecode(response.body)['data']['telp'];
    var kecamatan = jsonDecode(response.body)['data']['kecamatan'];
    var kabupaten = jsonDecode(response.body)['data']['kabupaten'];
    var provinsi = jsonDecode(response.body)['data']['provinsi'];
    var alamat = jsonDecode(response.body)['data']['alamat'];
    var kode_pos = jsonDecode(response.body)['data']['kode_pos'];
    var jenis_kelamin = jsonDecode(response.body)['data']['jenis_kelamin'];
    var imageUrl = jsonDecode(response.body)['data']['imageUrl'];

    UserModel user = UserModel(
        id: id,
        email: emailJson,
        name: nama,
        username: usernameJson,
        saldo: saldo,
        token: token,
        telp: telp,
        kecamatan: kecamatan,
        kabupaten: kabupaten,
        provinsi: provinsi,
        alamat: alamat,
        kode_pos: kode_pos,
        jenis_kelamin: jenis_kelamin,
        imageUrl: imageUrl);

    return user;
  }

  Future<UserModel> updateUser(
      {String nama = '',
      String telp = '',
      String jenis_kelamin = '',
      String alamat = '',
      File? gambar,
      required String token}) async {
    var url = Uri.parse('${baseUrl}/save_edit_user');
    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var data = jsonEncode({
      'nama_lengkap': nama,
      'telp': telp,
      'jenis_kelamin': jenis_kelamin,
      'alamat': alamat,
      //'imageUrl': gambar
    });

    var response = await http.post(url, headers: header, body: data);

    //print(response.body);

    var id = jsonDecode(response.body)['data']['id'];
    var resp_nama = jsonDecode(response.body)['data']['name'];
    var usernameJson = jsonDecode(response.body)['data']['username'];
    var emailJson = jsonDecode(response.body)['data']['email'];
    var saldo = jsonDecode(response.body)['data']['saldo'];
    var resp_token = jsonDecode(response.body)['token'];
    var resp_telp = jsonDecode(response.body)['data']['telp'];
    var kecamatan = jsonDecode(response.body)['data']['kecamatan'];
    var kabupaten = jsonDecode(response.body)['data']['kabupaten'];
    var provinsi = jsonDecode(response.body)['data']['provinsi'];
    var resp_alamat = jsonDecode(response.body)['data']['alamat'];
    var kode_pos = jsonDecode(response.body)['data']['kode_pos'];
    var resp_jenis_kelamin = jsonDecode(response.body)['data']['jenis_kelamin'];
    var imageUrl = jsonDecode(response.body)['data']['imageUrl'];

    UserModel user = UserModel(
        id: id,
        email: emailJson,
        name: resp_nama,
        username: usernameJson,
        saldo: saldo,
        token: token,
        telp: resp_telp,
        kecamatan: kecamatan,
        kabupaten: kabupaten,
        provinsi: provinsi,
        alamat: alamat,
        kode_pos: kode_pos,
        jenis_kelamin: resp_jenis_kelamin,
        imageUrl: imageUrl);

    return user;
  }
}
