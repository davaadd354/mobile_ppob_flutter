import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/auth_cubit.dart';
import '../theme/theme.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailText = TextEditingController(text: '');
    TextEditingController passwordText = TextEditingController(text: '');

    Widget button() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: kRedColor, content: Text('error')));
          } else if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: double.infinity,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: 10)),
                  onPressed: () {
                    context.read<AuthCubit>().signIn(
                        email: emailText.text, password: passwordText.text);
                  },
                  child: Text(
                    'LOGIN',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            );
          }
        },
      );
    }

    Widget password() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          cursorColor: kPrimaryColor,
          controller: passwordText,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: Icon(
                Icons.key,
                color: kPrimaryColor,
              ),
              filled: true,
              labelText: 'Password',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: emailText,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
              filled: true,
              labelText: 'Email',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'MASUK',
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Silahkan login menggunakan akun Tuku Pulsa',
                        style: whiteTextStyle.copyWith(fontWeight: light))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [email(), password(), button()],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: greyTextStyle.copyWith(
                          fontWeight: light, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        child: Text(
                          'Daftar',
                          style: purpleTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
