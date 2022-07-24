part of 'operator_cubit.dart';

abstract class OperatorState extends Equatable {
  const OperatorState();

  @override
  List<Object> get props => [];
}

class OperatorInitial extends OperatorState {}

class OperatorLoading extends OperatorState {}

class OperatorSuccess extends OperatorState {
  late final List<OperatorModel> operator;
  OperatorSuccess(this.operator);

  @override
  List<Object> get props => [operator];
}

class OperatorFailed extends OperatorState {
  late final String errorMessage;

  OperatorFailed(this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
