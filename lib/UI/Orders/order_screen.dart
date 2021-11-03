import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_test/Model/sales_data.dart';
import 'package:order_test/UI/Orders/widgets/orders_list_widget.dart';
import 'package:order_test/UI/statistics/statistics_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import '../../m_colors.dart';
import 'cubit/orders_cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin , AutomaticKeepAliveClientMixin {


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


    final cubit = BlocProvider.of<OrdersCubit>(context,listen: false);
    // final List<SalesData> chartData = [
    //   SalesData("Saturday", ),
    //   SalesData("Sunday", 2),
    //   SalesData("Sunday", 3),
    //   SalesData("Sunday", 4),
    //   SalesData("Sunday", 5)
    // ];
    void _taped(int status) {
      cubit.getData(context);
      // setState(() {
      //
      // });
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatisticsScreen(cubit)));

              },
              icon: Icon(CupertinoIcons.circle_grid_3x3))
        ],
      ),
      body: 

      Padding(
        padding: const EdgeInsets.all(12.0),
        child: ordersListWidget(context, cubit.model)
      ),
    );


  }

  @override

  bool get wantKeepAlive => true;


}

// Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white,
// height: 250,
// child: SfCartesianChart(
// primaryXAxis: DateTimeAxis(),
//
// enableSideBySideSeriesPlacement: false,
// series: <ChartSeries>[
//
// // Renders column chart
// ColumnSeries<SalesData, DateTime>(
//
// color: MColors.colorPrimarySwatch,
// trackColor: MColors.colorPrimary,
// borderColor: MColors.colorPrimary,
// trackBorderColor: MColors.colorPrimary,
// dataSource: cubit.chartData,
// xValueMapper: (SalesData sales, _) => sales.year,
// yValueMapper: (SalesData sales, _) => sales.sales)
// ]))



