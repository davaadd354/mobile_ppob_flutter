import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PagesCubit extends Cubit<int> {
  PagesCubit() : super(0);

  void setPage(int index) {
    emit(index);
  }
}
