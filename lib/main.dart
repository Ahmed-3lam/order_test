import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_test/Orders/order_screen.dart';

import 'Orders/cubit/orders_cubit.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrdersCubit().getData(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => OrdersCubit()..getData(context)),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
home: OrderScreen(),
        ));
  }
}
