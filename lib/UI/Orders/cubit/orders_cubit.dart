import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_test/Model/order_model.dart';
import 'package:order_test/Model/sales_data.dart';

import '../order_screen.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  double? _pointerValue = 60;

  double? get pointerValue => _pointerValue;

  set pointerValue(double? value) {
    _pointerValue = value;
  }

  List<OrderModel> model = [];
  List<SalesData> chartData = [];

  Future<void> getData(BuildContext context) async {
    emit(OrdersLoadingState());
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/orders.json");


    List<dynamic> parsedJson = jsonDecode(data);
    model = parsedJson.map((item) => OrderModel.fromJson(item)).toList();

    for (int i = 0; i < model.length; i++) {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      DateTime dateTime =
          dateFormat.parse(model[i].registered!.substring(0, 10));
      print(dateTime.toString());
      chartData.add(SalesData(
          dateTime,
          double.parse(
              model[i].price!.replaceAll("\$", "").replaceAll(",", ""))));
    }

    emit(OrdersSuccessState());
    // List<OrderModel> modelList = OrderModel.fromJson( data[0] as OrderModel());
  }
}
