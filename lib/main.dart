import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/Orders/cubit/orders_cubit.dart';
import 'UI/Orders/order_screen.dart';

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
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
home: OrderScreen(),
        ));
  }
}
