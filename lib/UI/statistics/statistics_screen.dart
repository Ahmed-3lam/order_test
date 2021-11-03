import 'package:flutter/material.dart';
import 'package:order_test/Model/sales_data.dart';
import 'package:order_test/UI/Orders/cubit/orders_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../m_colors.dart';

class StatisticsScreen extends StatelessWidget {
  final OrdersCubit cubit;

  const StatisticsScreen( this.cubit) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          height: 250,
          child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),

              enableSideBySideSeriesPlacement: false,
              series: <ChartSeries>[

                // Renders column chart
                ColumnSeries<SalesData, DateTime>(

                    color: MColors.colorPrimarySwatch,
                    trackColor: MColors.colorPrimary,
                    borderColor: MColors.colorPrimary,
                    trackBorderColor: MColors.colorPrimary,
                    dataSource: cubit.chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales)
              ])),
    );
  }
}
