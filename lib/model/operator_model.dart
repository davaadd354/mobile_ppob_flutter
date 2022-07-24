import 'package:equatable/equatable.dart';

class OperatorModel extends Equatable {
  late final String? code;
  late final String? description;
  late final String? nominal;
  late final String? details;
  late final String? type;
  late final int? price;
  late final String? active_period;
  late final String? status;
  late final String? imageUrl;

  OperatorModel(
      {required this.code,
      this.description = '',
      this.nominal = '',
      this.details = '',
      this.type = '',
      required this.price,
      this.active_period = '',
      required this.status,
      this.imageUrl = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [
        code,
        description,
        nominal,
        details,
        type,
        price,
        active_period,
        status,
        imageUrl
      ];
}
