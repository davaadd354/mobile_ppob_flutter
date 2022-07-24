import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/checkout_cubit.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/widget/daftar_transaksi.dart';
import '../theme/theme.dart';

class TransactionPage extends StatefulWidget {
  final UserModel user;
  const TransactionPage({Key? key, required this.user}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context
        .read<CheckoutCubit>()
        .dataTransaction(user_id: widget.user.id!, token: widget.user.token!);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Transaksi',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckoutData) {
            return Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: ListView(
                children: state.transaksi
                    .map((e) => DaftarTransaksi(transaksi: e))
                    .toList(),
              ),
            );
          }
          return Center(
            child: Text('Tidak ada data transaksi'),
          );
        },
      ),
    );
  }
}
