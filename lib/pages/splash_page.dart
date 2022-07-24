import 'dart:async';

import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/sign_up', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'TUKU PULSA',
          style: whiteTextStyle.copyWith(fontSize: 28, fontWeight: semiBold),
        ),
      ),
    );
  }
}
