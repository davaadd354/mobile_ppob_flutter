import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/auth_cubit.dart';
import 'package:mobile_flutter_ppob/cubit/checkout_cubit.dart';
import 'package:mobile_flutter_ppob/cubit/operator_cubit.dart';
import 'package:mobile_flutter_ppob/pages/home_pages.dart';
import 'package:mobile_flutter_ppob/pages/main_page.dart';
import 'package:mobile_flutter_ppob/pages/sign_page.dart';
import 'package:mobile_flutter_ppob/pages/sign_up.dart';
import 'package:mobile_flutter_ppob/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => OperatorCubit()),
        BlocProvider(create: (context) => CheckoutCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': ((context) => SplashPage()),
          '/sign_up': ((context) => SignUp()),
          '/sign_in': ((context) => SignIn()),
          '/home': ((context) => MainPage())
        },
      ),
    );
  }
}
