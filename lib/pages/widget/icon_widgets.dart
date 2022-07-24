import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/model/operator_model.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/operator_page.dart';
import 'package:mobile_flutter_ppob/pages/operator_pulsa.dart';
import '../../theme/theme.dart';
import 'package:crypto/crypto.dart';

class IconWidgetsPage extends StatelessWidget {
  final String? imagUrl;
  final String? title;
  final String? operator;
  final UserModel user;
  const IconWidgetsPage(
      {Key? key,
      required this.imagUrl,
      required this.title,
      required this.user,
      this.operator = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (operator == 'pulsa') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OperatorPulsa(
                        user: user,
                      )));
        }
        if (operator != '' && operator != 'pulsa') {
          var kede = utf8.encode("08224395436855562b9ae9041856fba7pl");
          var sign_key = md5.convert(kede);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OperatorPage(
                        title: title,
                        username: '082243954368',
                        sign: sign_key.toString(),
                        op: operator,
                        user: user,
                      )));
        }
      },
      child: Container(
        width: 75,
        child: Column(
          children: [
            Image.asset(
              imagUrl!,
              width: 50,
              color: kPrimaryColor,
            ),
            Text(
              title!,
              style: greyTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
