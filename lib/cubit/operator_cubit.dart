import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_flutter_ppob/services/OperatorServices.dart';

import '../model/operator_model.dart';

part 'operator_state.dart';

class OperatorCubit extends Cubit<OperatorState> {
  OperatorCubit() : super(OperatorInitial());

  void getOp(
      {required String op,
      required String sign,
      required String username,
      String token = ''}) async {
    try {
      emit(OperatorLoading());
      List<OperatorModel> operator = await OperatorServices()
          .getOperator(op: op, sign: sign, username: username, token: token);
      emit(OperatorSuccess(operator));
    } catch (e) {
      emit(OperatorFailed(e.toString()));
    }
  }
}
