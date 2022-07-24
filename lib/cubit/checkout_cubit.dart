import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_flutter_ppob/model/transaction_model.dart';
import 'package:mobile_flutter_ppob/services/TransactionService.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void transaction(
      {required String telp,
      required int harga,
      required String product_code,
      required String product_description,
      required String product_nominal,
      String product_details = '',
      required String token}) async {
    try {
      emit(CheckoutLoading());
      bool status = await TransactionSErvices().getTransaction(
          telp: telp,
          harga: harga,
          product_code: product_code,
          product_description: product_description,
          product_nominal: product_nominal,
          token: token);
      emit(CheckoutSuccess(status));
    } catch (e) {
      emit(CheckoutFailed(e.toString()));
    }
  }

  void dataTransaction({required int user_id, required String token}) async {
    try {
      emit(CheckoutLoading());
      List<TransactionModel> transactions =
          await TransactionSErvices().dataTransaksi(id: user_id, token: token);
      emit(CheckoutData(transactions));
    } catch (e) {
      emit(CheckoutFailed(e.toString()));
    }
  }
}
