import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import '../theme/theme.dart';

class SaldoPage extends StatelessWidget {
  final UserModel user;
  const SaldoPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ini halaman saldo'),
      ),
    );
  }
}
