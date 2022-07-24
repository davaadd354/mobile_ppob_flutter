import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  int? id;
  int? user_id;
  String? transaksi_id;
  String? harga;
  int? customer_id;
  String? product_code;
  String? product_description;
  String? product_nominal;
  String? product_details;
  int? status;

  TransactionModel(
      {this.id,
      this.user_id,
      this.transaksi_id,
      this.harga,
      this.customer_id,
      this.product_code,
      this.product_description,
      this.product_nominal,
      this.product_details,
      this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        user_id,
        transaksi_id,
        harga,
        customer_id,
        product_code,
        product_description,
        product_nominal,
        product_details,
        status
      ];
}
