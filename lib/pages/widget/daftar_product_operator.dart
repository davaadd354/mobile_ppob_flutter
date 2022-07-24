import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/function/number_format.dart';
import 'package:mobile_flutter_ppob/function/telepon_format.dart';
import 'package:mobile_flutter_ppob/model/operator_model.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/checkout_page.dart';
import '../../theme/theme.dart';

class DaftarProductOperator extends StatelessWidget {
  final OperatorModel operator;
  final String type;
  final String telp;
  final UserModel user;
  const DaftarProductOperator(
      {Key? key,
      required this.operator,
      this.telp = '',
      this.type = '',
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var warna = operator.status == 'active' ? greenTextStyle : redTextStyle;
    return GestureDetector(
      onTap: () {
        if (operator.status == 'active') {
          if (type == 'pulsa') {
            if (isValidPhoneNumber(telp)) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                            telp: telp,
                            operator: operator,
                            user: user,
                          )));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: kRedColor,
                  content: Text('Mohon masukkan format telepon yang benar')));
            }
          }
        }
      },
      child: Container(
        height: 120,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  operator.status!,
                  style: warna.copyWith(fontWeight: semiBold, fontSize: 16),
                )
              ],
            ),
            Text(
              operator.nominal!,
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              operator.code!,
              style: greyTextStyle.copyWith(fontWeight: medium),
            ),
            Text(
              'Rp.${formatAmount(operator.price.toString())}',
              style: greenTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
