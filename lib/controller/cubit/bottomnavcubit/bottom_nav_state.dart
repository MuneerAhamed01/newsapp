part of 'bottom_nav_cubit.dart';

@immutable
abstract class BottomNavState {}

class BottomnavigationChanging extends BottomNavState {
  final int index;

  BottomnavigationChanging(this.index);
}
