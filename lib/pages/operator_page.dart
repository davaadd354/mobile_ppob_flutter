import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/operator_cubit.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/widget/daftar_product_operator.dart';
import '../../theme/theme.dart';

class OperatorPage extends StatefulWidget {
  final String? title;
  final String? op;
  final String? username;
  final String? sign;
  final UserModel user;
  const OperatorPage(
      {Key? key,
      required this.title,
      required this.op,
      required this.username,
      required this.user,
      required this.sign})
      : super(key: key);

  @override
  State<OperatorPage> createState() => _OperatorPageState();
}

class _OperatorPageState extends State<OperatorPage> {
  @override
  void initState() {
    // TODO: implement initState

    if (widget.op != '') {
      context.read<OperatorCubit>().getOp(
          op: widget.op!,
          sign: widget.sign!,
          username: widget.username!,
          token: widget.user.token!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocConsumer<OperatorCubit, OperatorState>(
        listener: (context, state) {
          if (state is OperatorFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor, content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is OperatorSuccess) {
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              color: kBackgroundColor,
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: state.operator.map((e) {
                      return DaftarProductOperator(
                        type: e.type!,
                        operator: e,
                        user: widget.user,
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
