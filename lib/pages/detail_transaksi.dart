import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_ppob/function/number_format.dart';
import 'package:mobile_flutter_ppob/model/transaction_model.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/theme/theme.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionModel transaksi;
  const TransactionDetail({Key? key, required this.transaksi})
      : super(key: key);

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

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Detail Pesanan',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kGreyColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nominal',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            transaksi.product_nominal!,
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kGreyColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            'Rp.${formatAmount(transaksi.harga.toString())}',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kGreyColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No Telp',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            '${transaksi.customer_id}',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kGreyColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Provider',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            transaksi.product_description!,
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kGreyColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            status,
                            style: warna.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
