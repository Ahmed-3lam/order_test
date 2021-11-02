import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:order_test/Model/order_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  double? _pointerValue = 60;

  double? get pointerValue => _pointerValue;

  set pointerValue(double? value) {
    _pointerValue = value;
  }

  List<OrderModel> model = [];

  Future<void> getData(BuildContext context) async {
    emit(OrdersLoadingState());
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/orders.json");
    // print(data);

    List<dynamic> parsedJson = jsonDecode(data);
   model =
        parsedJson.map((item) => OrderModel.fromJson(item)).toList();

    print(model[0].company);
    print(model[1].company);
    emit(OrdersSuccessState());
    // List<OrderModel> modelList = OrderModel.fromJson( data[0] as OrderModel());
  }
}
