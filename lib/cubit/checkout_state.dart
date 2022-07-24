part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  late final bool status;

  CheckoutSuccess(this.status);

  @override
  // TODO: implement props
  List<Object> get props => [status];
}

class CheckoutFailed extends CheckoutState {
  final String err;

  CheckoutFailed(this.err);

  @override
  // TODO: implement props
  List<Object> get props => [err];
}

class CheckoutData extends CheckoutState {
  final List<TransactionModel> transaksi;
  CheckoutData(this.transaksi);

  @override
  // TODO: implement props
  List<Object> get props => [transaksi];
}
