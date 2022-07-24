import 'package:flutter/material.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/edit_profile.dart';
import 'package:mobile_flutter_ppob/pages/home_pages.dart';
import '../theme/theme.dart';
import 'package:flutter_image/flutter_image.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel user;
  const UserProfilePage({Key? key, required this.user}) : super(key: key);

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'PROFIL PENGGUNA',
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => EditProfile(
                                      user: user,
                                    ))));
                      },
                      child: Icon(
                        Icons.edit,
                        color: kWhiteColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )));
    }

    Widget detailProfile(
        {required String judul, String? keterangan, required Icon icon}) {
      return Row(
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.grey.withOpacity(0.5))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  keterangan == '0'
                      ? SizedBox(
                          height: 10,
                        )
                      : Text(
                          keterangan!,
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                  Text(
                    judul,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.5), fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget cardProfile() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 120,
            margin: EdgeInsets.only(left: 10, right: 10, top: 180),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                boxShadow: [BoxShadow(color: kBlackColor, blurRadius: 1.0)]),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                boxShadow: [BoxShadow(color: kBlackColor, blurRadius: 1.0)]),
            child: Column(
              children: [
                detailProfile(
                    judul: 'Nama Pengguna',
                    keterangan: user.name!,
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    )),
                detailProfile(
                    judul: 'Alamat Email',
                    keterangan: user.email!,
                    icon: Icon(
                      Icons.email,
                      size: 30,
                    )),
                detailProfile(
                    judul: 'Nomor Telephon',
                    keterangan: user.telp!,
                    icon: Icon(
                      Icons.phone_android,
                      size: 30,
                    )),
                detailProfile(
                    judul: 'Jenis Kelamin',
                    keterangan: user.jenis_kelamin!,
                    icon: Icon(
                      Icons.male,
                      size: 30,
                    )),
                detailProfile(
                    judul: 'Alamat',
                    keterangan: user.alamat!,
                    icon: Icon(
                      Icons.location_on,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      );
    }

    Widget testing() {
      Widget gambar() {
        if (user.imageUrl != null &&
            user.imageUrl != '' &&
            user.imageUrl != 0) {
          return CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'http://192.168.43.44:8080/gambar_custom/1658420166_Screenshot (151).png'));
        }
        return CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://picsum.photos/200'));
      }

      return Center(
        child: Column(
          children: [
            Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 130, bottom: 10),
                child: gambar()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    user.name!,
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
              ],
            ),
            Text(
              user.email!,
              style: blackTextStyle,
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [header(), cardProfile(), testing()],
        ),
      ],
    ));
  }
}
