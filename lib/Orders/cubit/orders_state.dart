part of 'orders_cubit.dart';

// @immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}
class OrdersLoadingState extends OrdersState {}
class OrdersSuccessState extends OrdersState {}
class OrdersErrorState extends OrdersState {}
