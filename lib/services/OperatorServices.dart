import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:mobile_flutter_ppob/model/operator_model.dart';

class OperatorServices {
  String baseUrl = 'http://192.168.43.44:8080/api';
  //String baseUrl = 'http://50.50.50.198:8080/api';

  Future<List<OperatorModel>> getOperator(
      {required String op,
      required String sign,
      required String username,
      String token = ''}) async {
    try {
      var url = Uri.parse(
          'http://192.168.43.44:8080/api/getDataOperator?operator=$op');

      var header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await http.post(url, headers: header);

      var tes = response.statusCode;

      var datas = jsonDecode(response.body)['data']['pricelist'];

      List<OperatorModel> operators = [];

      datas.forEach((d) {
        operators.add(OperatorModel(
            code: d['product_code'],
            description: d['product_description'],
            nominal: d['product_nominal'],
            details: d['product_details'],
            price: d['product_price'],
            type: d['product_type'],
            active_period: d['active_period'],
            status: d['status'],
            imageUrl: d['icon_url']));
      });

      return operators;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
