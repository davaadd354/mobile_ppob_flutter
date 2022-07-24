import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/checkout_cubit.dart';
import 'package:mobile_flutter_ppob/function/number_format.dart';
import 'package:mobile_flutter_ppob/model/operator_model.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/main_page.dart';
import '../theme/theme.dart';

class CheckoutPage extends StatelessWidget {
  final String telp;
  final OperatorModel operator;
  final UserModel user;
  const CheckoutPage(
      {Key? key,
      required this.telp,
      required this.operator,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Konfirmasi Pesanan',
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
                    Text(
                      'Produk Dipilih',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
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
                            'Nominal',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            operator.nominal!,
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
                            'Rp.${formatAmount(operator.price.toString())}',
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
                            '$telp',
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
                            operator.description!,
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<CheckoutCubit, CheckoutState>(
              listener: (context, state) {
                if (state is CheckoutFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kRedColor, content: Text(state.err)));
                } else if (state is CheckoutSuccess) {
                  if (state.status) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kGreenColor,
                        content: Text('Transaksi berhasil')));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                                  dataIndex: 2,
                                )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kRedColor,
                        content: Text('Transaksi gagal')));
                  }
                }
              },
              builder: (context, state) {
                if (state is CheckoutLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    height: 45,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                      onPressed: (() {
                        context.read<CheckoutCubit>().transaction(
                            telp: telp,
                            harga: operator.price!,
                            product_code: operator.code!,
                            product_description: operator.description!,
                            product_nominal: operator.nominal!,
                            token: user.token!);
                      }),
                      child: Text(
                        'Bayar Sekarang',
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
