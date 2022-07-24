import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter_ppob/cubit/auth_cubit.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/home_pages.dart';
import 'package:mobile_flutter_ppob/pages/saldo_page.dart';
import 'package:mobile_flutter_ppob/pages/transaction_page.dart';
import 'package:mobile_flutter_ppob/pages/user_profile_page.dart';
import '../theme/theme.dart';

class MainPage extends StatefulWidget {
  int dataIndex;
  MainPage({Key? key, this.dataIndex = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int _index = 0;

  void initState() {
    // TODO: implement initState
    _index = widget.dataIndex;
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget homePage(UserModel user) {
      switch (_index) {
        case 0:
          return HomePage(
            user: user,
          );
        case 1:
          return SaldoPage(
            user: user,
          );
        case 2:
          return TransactionPage(
            user: user,
          );
        case 3:
          return UserProfilePage(
            user: user,
          );
        default:
          return HomePage(
            user: user,
          );
      }
    }

    void _setIndex(int index) {
      setState(() {
        _index = index;
        print(_index);
      });
    }

    Widget bottomCustomNav() {
      return BottomAppBar(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kPrimaryColor,
          selectedItemColor: kWhiteColor,
          unselectedItemColor: kGreyColor,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Saldo",
              icon: Icon(Icons.attach_money_outlined),
            ),
            BottomNavigationBarItem(
              label: "Transaksi",
              icon: Icon(Icons.grid_view),
            ),
            BottomNavigationBarItem(
              label: "Akun Saya",
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      );
    }

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return homePage(state.user);
          } else {
            return Center(
              child: Text('gagal ambil data'),
            );
          }
        },
      ),
      bottomNavigationBar: bottomCustomNav(),
    );
  }
}
