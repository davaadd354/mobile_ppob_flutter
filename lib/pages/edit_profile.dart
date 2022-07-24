import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_flutter_ppob/cubit/auth_cubit.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/pages/main_page.dart';
import 'package:mobile_flutter_ppob/pages/operator_pulsa.dart';
import 'package:mobile_flutter_ppob/theme/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final List<String> itemData = ['Laki Laki', 'Perempuan'];
String selectedValue = '';
String noTelp = '';
String name = '';
String alamat = '';
var imagePicker;
File? _image;

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    // TODO: implement initState
    selectedValue = widget.user.jenis_kelamin!;
    noTelp = widget.user.telp!;
    name = widget.user.name!;
    alamat = widget.user.alamat!;
    _image = null;
    imagePicker = ImagePicker();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget formSelect() {
      if (widget.user.jenis_kelamin != null &&
          widget.user.jenis_kelamin != '') {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                labelText: 'Jenis Kelamin',
                labelStyle: purpleTextStyle.copyWith(fontSize: 15)),
            hint: Text(
              'Pilih Kelamin',
              style: TextStyle(
                fontSize: 14,
                color: kBlackColor,
              ),
            ),
            items: itemData
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium)),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            value: selectedValue,
            itemHeight: 55,
          ),
        );
      } else {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                labelText: 'Jenis Kelamin',
                labelStyle: purpleTextStyle.copyWith(fontSize: 15)),
            hint: Text(
              'Pilih Kelamin',
              style: TextStyle(
                fontSize: 14,
                color: kBlackColor,
              ),
            ),
            items: itemData
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium)),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            itemHeight: 55,
          ),
        );
      }
    }

    Widget formTelp() {
      return TextFormField(
        initialValue: widget.user.telp,
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
      );
    }

    Widget formNama({
      required String title,
      required Icon icon,
      required String value,
    }) {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
          initialValue: value,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: icon,
              filled: true,
              labelText: title,
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget formAlamat({
      required String title,
      required Icon icon,
      required String value,
    }) {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              alamat = value;
            });
          },
          initialValue: value,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)),
              prefixIcon: icon,
              filled: true,
              labelText: title,
              labelStyle: TextStyle(color: kPrimaryColor)),
        ),
      );
    }

    Widget formEdit() {
      return Container(
        child: Column(
          children: [
            formNama(
                title: 'Nama Lengkap',
                icon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                value: widget.user.name!),
            formTelp(),
            SizedBox(
              height: 20,
            ),
            formSelect(),
            SizedBox(
              height: 20,
            ),
            formAlamat(
                title: 'Alamat',
                icon: Icon(
                  Icons.location_on,
                  color: kPrimaryColor,
                ),
                value: widget.user.alamat! == '0' ? '' : widget.user.alamat!),
          ],
        ),
      );
    }

    Widget imageProfile() {
      NetworkImage networkImage = NetworkImage('https://picsum.photos/200');

      Widget gambar() {
        if (_image != null) {
          return CircleAvatar(radius: 60, backgroundImage: FileImage(_image!));
        } else {
          if (widget.user.imageUrl != null &&
              widget.user.imageUrl != '' &&
              widget.user.imageUrl != 0) {
            return CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'http://192.168.43.44:8080/gambar_custom/1658420166_Screenshot (151).png'));
          }
          return CircleAvatar(radius: 60, backgroundImage: networkImage);
        }
      }

      return Center(
        child: Stack(
          children: [
            gambar(),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  var source = ImageSource.gallery;

                  var image = await imagePicker.pickImage(
                      source: source,
                      imageQuality: 50,
                      preferredCameraDevice: CameraDevice.front);

                  if (image != null) {
                    setState(() {
                      _image = File(image.path);
                      print(widget.user.imageUrl);
                    });
                  }
                },
                child: Icon(
                  Icons.camera_alt,
                ),
              ),
            )
          ],
        ),
      );
    }

    void tes() async {
      var url = 'http://192.168.43.44:8080/api/save_edit_user';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var token = widget.user.token;
      var nama = name;
      var telp = noTelp;

      //headers
      request.headers.addAll({
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      // Fields
      request.fields['nama_lengkap'] = nama;
      request.fields['telp'] = telp;
      request.fields['alamat'] = alamat;

      var testing = await request.send();
      print(testing.statusCode);
    }

    Widget button() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            //   Navigator.pushNamedAndRemoveUntil(
            //       context, '/home', (route) => false);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(
                          dataIndex: 3,
                        )));
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
                    // context.read<AuthCubit>().udateData(
                    //     nama: name,
                    //     telp: noTelp,
                    //     jenis_kelamin: selectedValue,
                    //     alamat: alamat,
                    //     gambar: _image,
                    //     user_data: widget.user);
                    tes();
                  },
                  child: Text(
                    'UBAH PROFIL',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            );
          }
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profil'),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: ListView(
            children: [
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              formEdit(),
              button()
            ],
          ),
        ));
  }
}
