import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/widget/icon_widgets.dart';
import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          width: double.infinity,
          height: 225,
          color: kPrimaryColor,
          child: SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 30, bottom: 30, left: 20),
            child: Text(
              'TUKU PULSA',
              style:
                  whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
          )));
    }

    Widget saldo() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 100,
        margin: EdgeInsets.only(left: 20, right: 20, top: 200),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Image.asset(
              'assets/icon_dompet.png',
              width: 50,
              color: kPrimaryColor,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo',
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Text(
                      'Rp.100.000,00',
                      overflow: TextOverflow.ellipsis,
                      style: greenTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Top Up',
                  style: purpleTextStyle,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: kWhiteColor,
              margin: EdgeInsets.only(top: 330),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    //margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: kGreyColor, width: 1))),
                    child: Text(
                      'Isi Ulang',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconWidgetsPage(
                              title: 'Pulsa',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'pulsa',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Pulsa \n Transfer',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Telepon',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Token PLN',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconWidgetsPage(
                              title: 'Axis',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'axis_paket_internet',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Indosat',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'indosat_paket_internet',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Smartfren',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'indosat_paket_internet',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Telkomsel',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'telkomsel_paket_internet',
                              user: user,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconWidgetsPage(
                              title: 'XL',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'xl_paket_internet',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Three',
                              imagUrl: 'assets/smartphone.png',
                              operator: 'tri_paket_internet',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Voucher',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Games',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: kWhiteColor,
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    //margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: kGreyColor, width: 1))),
                    child: Text(
                      'Tagihan dan Game',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconWidgetsPage(
                              title: 'BPJS',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Listrik',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Air PDAM',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Internet & \n TV',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconWidgetsPage(
                              title: 'Mobile \n Legends',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Free Fire',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'PUBG',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                            IconWidgetsPage(
                              title: 'Garena',
                              imagUrl: 'assets/smartphone.png',
                              user: user,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [header(), saldo(), content()],
        ),
      ),
    );
  }
}
