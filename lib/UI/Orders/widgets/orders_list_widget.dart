import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_test/Model/order_model.dart';
import 'package:order_test/UI/Orders/cubit/orders_cubit.dart';


import 'orders_list_item.dart';

Widget ordersListWidget(context, List<OrderModel> model) {
  // if (index == 0) {
  //   index = null;
  // }
  return BlocProvider(
      create: (BuildContext context) =>
          OrdersCubit()..getData(context),
            // ..getAllOrdersData(status: index),
      child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<OrdersCubit>(context);



            return ListView.builder(
              itemCount: cubit.model.length,
              itemBuilder: (BuildContext context, int index) {
                return ordersListItem(context, cubit.model, index);
              },
            );
          }));
}
