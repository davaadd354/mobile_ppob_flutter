import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/cubit/operator_cubit.dart';
import 'package:mobile_flutter_ppob/function/telepon_format.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/widget/daftar_product_operator.dart';
import '../../theme/theme.dart';
import 'package:crypto/crypto.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OperatorPulsa extends StatefulWidget {
  final UserModel user;
  const OperatorPulsa({Key? key, required this.user}) : super(key: key);

  @override
  State<OperatorPulsa> createState() => _OperatorPulsaState();
}

final List<dynamic> items = [
  'axis',
  'indosat',
  'smart',
  'telkomsel',
  'three',
  'xl'
];
String? selectedValue;
String? noTelp;

class _OperatorPulsaState extends State<OperatorPulsa> {
  @override
  void initState() {
    String selectedValue = '';
    String noTelp = '';
    print('init');
    super.initState();
  }

  Widget build(BuildContext context) {
    var kede = utf8.encode("08224395436855562b9ae9041856fba7pl");
    var sign_key = md5.convert(kede);
    //TextEditingController telp = TextEditingController(text: '');
    Widget telepon() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          initialValue: noTelp,
          onChanged: (val) {
            setState(() {
              noTelp = val;
            });
          },
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: Icon(
                Icons.phone_android_sharp,
                color: kPrimaryColor,
              ),
              filled: true,
              labelText: 'Telephone',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget selectProvider() {
      return DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Pilih Operator',
            style: TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium)),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String?;
              //print(telp.text);
              context.read<OperatorCubit>().getOp(
                  op: selectedValue!,
                  sign: sign_key.toString(),
                  username: '082243954368',
                  token: widget.user.token!);
            });
          },
          buttonHeight: 55,
          buttonWidth: double.infinity,
          itemHeight: 40,
          buttonPadding: EdgeInsets.symmetric(horizontal: 10),
          buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: kPrimaryColor),
              color: kBackgroundColor),
        ),
      );
    }

    Widget content() {
      return BlocConsumer<OperatorCubit, OperatorState>(
        listener: (context, state) {
          if (state is OperatorFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor, content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is OperatorSuccess) {
            List<dynamic> op_pulsa = [];

            state.operator.forEach((element) {
              if (element.type == 'pulsa') {
                op_pulsa.add(element);
              }
            });

            return Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: kBackgroundColor,
                child: Column(
                    children: op_pulsa.map(
                  (e) {
                    return DaftarProductOperator(
                      type: e.type!,
                      telp: noTelp ?? 'kosong',
                      operator: e,
                      user: widget.user,
                    );
                  },
                ).toList()));
          } else if (state is OperatorLoading) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pulsa',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            margin: EdgeInsets.only(bottom: 20),
            color: kWhiteColor,
            height: 200,
            width: double.infinity,
            child: Column(
              children: [telepon(), selectProvider()],
            ),
          ),
          content()
        ],
      ),
    );
  }
}
