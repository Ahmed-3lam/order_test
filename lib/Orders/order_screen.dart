import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_test/Orders/widgets/orders_list_widget.dart';


import 'cubit/orders_cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin , AutomaticKeepAliveClientMixin {
  TabController? _cardController;

  List<Widget>? taps;

  @override
  Widget build(BuildContext context) {
    taps = [
      Tab(
        text: "All",
      ),
      Tab(
        text: "Pending",
      ),
      Tab(
        text: "Shipped",
      ),
      Tab(
        text: "Canceled",
      ),
    ];

    _cardController = TabController(length: taps!.length, vsync: this);
    final cubit = BlocProvider.of<OrdersCubit>(context,listen: false);
    //
    void _taped(int status) {
      cubit.getData(context);
      // setState(() {
      //
      // });
    }
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ordersListWidget(context, cubit.model)
      ),
    );


  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
