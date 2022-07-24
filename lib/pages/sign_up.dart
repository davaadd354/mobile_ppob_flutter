import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/auth_cubit.dart';
import '../theme/theme.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: '');
    TextEditingController usernameController = TextEditingController(text: '');
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');

    Widget nama_lengkap() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: nameController,
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
              labelText: 'Nama Lengkap',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget username() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: usernameController,
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
              labelText: 'Username',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: emailController,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: Icon(
                Icons.email,
                color: kPrimaryColor,
              ),
              filled: true,
              labelText: 'Alamat Email',
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget password() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: passwordController,
          cursorColor: kPrimaryColor,
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

    Widget button() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: kRedColor, content: Text('error')));
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kGreenColor, content: Text('Berhasil Login')));
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
                    context.read<AuthCubit>().register(
                        name: nameController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Text(
                    'MENDAFTAR',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            );
          }
        },
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
                      'PENDAFTARAN',
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Silahkan isi data dengan benar',
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
                  children: [
                    nama_lengkap(),
                    username(),
                    email(),
                    password(),
                    button()
                  ],
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
                      'Sudah punya akun?',
                      style: greyTextStyle.copyWith(
                          fontWeight: light, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_in');
                        },
                        child: Text(
                          'Login',
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
