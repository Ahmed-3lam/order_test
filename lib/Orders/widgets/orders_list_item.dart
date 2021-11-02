import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:order_test/Model/order_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../m_colors.dart';




class ordersListItem extends StatelessWidget {
  final BuildContext context;

  final List<OrderModel> model;
  final int index ;

  const ordersListItem( this.context, this.model, this.index) ;

  @override
  Widget build(BuildContext context) {
    final Brightness _brightness = Theme.of(context).brightness;

    const double _orderState = 0;
    const double _packedState = 1;
    const double _shippedState = 2;
    const double _deliveredState = 3;

    Color _orderStateColor = MColors.colorConfirmedStatues;
    Color _packedStateColor = MColors.colorConfirmedStatues;
    Color _shippedStateColor = MColors.colorConfirmedStatues;
    Color _deliveredStateColor = MColors.colorConfirmedStatues;
    Map<dynamic,dynamic> _statusMap ={
      "CONFIRMED":0,
      "DELIVERED":1,
      "RETURNED":2,
      "ORDERED":3
    };

    Color _linearBarColor = MColors.colorConfirmedStatues;
    double _linearBarStep = double.tryParse(_statusMap[model[index].status!].toString())!;

    switch (int.tryParse(_statusMap[model[index].status!].toString())) {
      case 0:
        _orderStateColor = MColors.colorConfirmedStatues;
        _linearBarColor = MColors.colorConfirmedStatues;
        _packedStateColor = MColors.colorProcessingStatuesLine;
        _shippedStateColor = MColors.colorProcessingStatuesLine;
        _deliveredStateColor = MColors.colorProcessingStatuesLine;
        break;
      case 1:
        _orderStateColor = MColors.colorProcessingDeliveredStatues;
        _linearBarColor = MColors.colorProcessingDeliveredStatues;
        _packedStateColor = MColors.colorProcessingDeliveredStatues;
        _shippedStateColor = MColors.colorProcessingStatuesLine;
        _deliveredStateColor = MColors.colorProcessingStatuesLine;
        break;
      case 2:
        _orderStateColor = MColors.colorShippedStatues;
        _linearBarColor = MColors.colorShippedStatues;
        _packedStateColor = MColors.colorShippedStatues;
        _shippedStateColor = MColors.colorShippedStatues;
        _deliveredStateColor = MColors.colorProcessingStatuesLine;
        break;
      case 3:
        _orderStateColor = MColors.colorProcessingDeliveredStatues;
        _linearBarColor = MColors.colorProcessingDeliveredStatues;
        _packedStateColor = MColors.colorProcessingDeliveredStatues;
        _shippedStateColor = MColors.colorProcessingDeliveredStatues;
        _deliveredStateColor = MColors.colorProcessingDeliveredStatues;
        break;
      case 4:
        _orderStateColor = MColors.colorCancelStatues;
        _linearBarColor = MColors.colorCancelStatues;
        _packedStateColor = MColors.colorCancelStatues;
        _shippedStateColor = MColors.colorCancelStatues;
        _deliveredStateColor = MColors.colorCancelStatues;
        break;
    }

    final Color _inactiveColor = _brightness == Brightness.dark
        ? const Color(0xff62686A)
        : const Color(0xFFD1D9DD);
    return GestureDetector(
      onTap: () {
        // Get.to(() =>  OrderDetailsScreen(model.data![index].id!));
      },
      child: ExpansionTile(
          title: Text("Order Number"+" "+ model[index].id!.toString()),
backgroundColor: Colors.grey[50],
          children: [
            // Text(
            //   "المنتج بحالة جيدة و مغلف باحكام، يتم استرجاعه خلال 3 ايام ",
            //   softWrap: true,
            // ),
            // Gaps.vGap8,
            Container(

                margin: const EdgeInsets.symmetric(vertical: 15, horizontal:100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(
                  //   width: 2,
                  //   color: MColors.colorPrimarySwatch,
                  // ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                    child: Column(
                      children: [
                        Container(


                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   'Order Number ${model[index].id}',
                              //   style: const TextStyle(
                              //     fontSize: 12,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                              // Text(
                              //   '${model.data![index].serial
                              //   }',
                              //   style: const TextStyle(
                              //     fontSize: 8,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                              // Text(
                              //   'CLient ${model[index].id} ',
                              //   style: const TextStyle(
                              //     fontSize: 12,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SfLinearGauge(
                          axisLabelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          orientation: LinearGaugeOrientation.vertical,
                          isAxisInversed:
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? true
                              : false,
                          minimum: 0,
                          maximum: 3,
                          labelOffset: 12,
                          showTicks: false,
                          onGenerateLabels: () {
                            return <LinearAxisLabel>[
                              LinearAxisLabel(
                                  text: "In Progress", value: _orderState),
                              LinearAxisLabel(
                                  text: "Pending", value: _packedState),
                              LinearAxisLabel(
                                  text: "Shipped", value: _shippedState),
                              LinearAxisLabel(
                                  text: "Completed", value: _deliveredState),
                            ];
                          },
                          axisTrackStyle: LinearAxisTrackStyle(
                            color: _inactiveColor,
                          ),
                          barPointers: <LinearBarPointer>[
                            LinearBarPointer(
                              value: _linearBarStep,
                              color: _linearBarColor,
                              enableAnimation: false,
                              position: LinearElementPosition.cross,
                            ),
                          ],
                          markerPointers: <LinearMarkerPointer>[
                            LinearWidgetPointer(
                              value: double.parse(_statusMap[model[index].status!].toString()),

                              position: LinearElementPosition.cross,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: _orderStateColor,
                                    border: Border.all(
                                        width: 4, color: _orderStateColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                // child: Center(
                                //   child:
                                //       Icon(Icons.check_rounded, size: 14, color: _activeColor),
                                // ),
                              ),
                            ),
                            LinearWidgetPointer(
                              enableAnimation:double.parse(_statusMap[model[index].status!].toString()) ==_packedState? true:false,
                              value: _packedState,
                              position: LinearElementPosition.cross,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: _packedStateColor,
                                    border: Border.all(
                                        width: 4, color: _packedStateColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                // child: Center(
                                //   child:
                                //       Icon(Icons.check_rounded, size: 14, color: _activeColor),
                                // ),
                              ),
                            ),
                            LinearWidgetPointer(
                              value: _shippedState,
                              enableAnimation: double.parse(_statusMap[model[index].status!].toString()) ==_shippedState? true:false,
                              position: LinearElementPosition.cross,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: _shippedStateColor,
                                    border: Border.all(
                                        width: 4, color: _shippedStateColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                                // child: Center(
                                //   child:
                                //       Icon(Icons.check_rounded, size: 14, color: _activeColor),
                                // ),
                              ),
                            ),
                            LinearShapePointer(
                              value: _deliveredState,
                              enableAnimation: double.parse(_statusMap[model[index].status!].toString()) ==_deliveredState? true:false,
                              color: _deliveredStateColor,
                              width: 18,
                              height: 18,
                              position: LinearElementPosition.cross,
                              shapeType: LinearShapePointerType.circle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ]),


    );
  }
}

