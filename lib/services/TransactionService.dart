import 'dart:convert';
import 'package:mobile_flutter_ppob/model/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionSErvices {
  String baseUrl = 'http://192.168.43.44:8080/api/';
  Future<bool> getTransaction(
      {required String telp,
      required int harga,
      required String product_code,
      required String product_description,
      required String product_nominal,
      String product_details = '',
      required String token}) async {
    var url = Uri.parse('${baseUrl}checkout');
    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //print(url);
    var data = jsonEncode({
      'telp': telp,
      'harga': harga,
      'product_code': product_code,
      'product_description': product_description,
      'product_nominal': product_nominal,
      'product_details': product_details
    });

    var response = await http.post(url, headers: header, body: data);
    print(response.body);
    //var resp = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<TransactionModel>> dataTransaksi(
      {required int id, required String token}) async {
    try {
      var url = Uri.parse('${baseUrl}dataTransaksi?user_id=${id}');
      print(url);
      var header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await http.get(url, headers: header);

      var dataJson = jsonDecode(response.body)['data'];
      List<TransactionModel> transactions = [];

      dataJson.forEach((d) {
        transactions.add(TransactionModel(
            id: d['id'],
            user_id: d['user_id'],
            transaksi_id: d['transaksi_id'].toString(),
            harga: d['harga'].toString(),
            customer_id: int.parse(d['customer_id']),
            product_code: d['product_code'],
            product_description: d['product_description'],
            product_nominal: d['product_nominal'],
            product_details: d['product_details'],
            status: d['status']));
      });

      return transactions;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
