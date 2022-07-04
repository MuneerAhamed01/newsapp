import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomnavigationChanging(0));
  void onChangingIndex(int index) {
    emit(BottomnavigationChanging(index));
  }
}
