import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_flutter_ppob/model/user_model.dart';
import 'package:mobile_flutter_ppob/services/AuthServices.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthServices().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      print(e);
      emit(AuthFailed(e.toString()));
    }
  }

  void register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices().signUp(
          name: name, username: username, email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      print(e);
      emit(AuthFailed(e.toString()));
    }
  }

  void udateData({
    required String nama,
    required String telp,
    String jenis_kelamin = '',
    String alamat = '',
    File? gambar,
    required UserModel user_data,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices().updateUser(
          token: user_data.token!,
          nama: nama,
          telp: telp,
          jenis_kelamin: jenis_kelamin,
          alamat: alamat,
          gambar: gambar);
      emit(AuthSuccess(user));
    } catch (e) {
      print(e);
      emit(AuthSuccess(user_data));
    }
  }
}
