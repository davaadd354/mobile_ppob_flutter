import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_ppob/function/number_format.dart';
import 'package:mobile_flutter_ppob/model/transaction_model.dart';
import 'package:mobile_flutter_ppob/pages/detail_transaksi.dart';
import '../../theme/theme.dart';
import 'package:flutter/material.dart';

class DaftarTransaksi extends StatelessWidget {
  final TransactionModel transaksi;
  const DaftarTransaksi({Key? key, required this.transaksi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var warna = greenTextStyle;
    var status = 'Gagal';
    switch (transaksi.status) {
      case 0:
        warna = GoogleFonts.poppins(
          color: Colors.amber[400],
        );
        status = 'Pending';
        break;
      case 1:
        warna = greenTextStyle;
        status = 'Berhasil';
        break;
      case 2:
        warna = redTextStyle;
        status = 'Gagal';
    }
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransactionDetail(transaksi: transaksi)));
      }),
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
                  status,
                  style: warna.copyWith(fontWeight: semiBold, fontSize: 16),
                )
              ],
            ),
            Text(
              transaksi.product_nominal!,
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              transaksi.product_description!,
              style: greyTextStyle.copyWith(fontWeight: medium),
            ),
            Text(
              'Rp.${formatAmount(transaksi.harga.toString())}',
              style: greenTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
