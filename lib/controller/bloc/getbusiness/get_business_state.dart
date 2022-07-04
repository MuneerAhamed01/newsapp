part of 'get_business_bloc.dart';

@immutable
abstract class GetBusinessState {}

class GetBusinessInitial extends GetBusinessState {}
class GetBusinessOnprosess extends GetBusinessState {}
class GetBusinessOnDone extends GetBusinessState {}
