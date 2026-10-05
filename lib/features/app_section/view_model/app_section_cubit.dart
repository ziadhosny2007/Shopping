import 'package:bloc/bloc.dart';
part 'app_section_state.dart';

class BottomNavCubitCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubitCubit() : super(HomeState());

  void intent(Intent intent) {
    if (intent is GetIndx) {
      getIndx(intent.index);
    }
  }

  void getIndx(int index) {
    switch (index) {
      case 0:
        emit(HomeState());
      case 1:
        emit(CartState());
      case 2:
        emit(FavouriteState());

      default:
        emit(AccountState());
    }
  }
}

sealed class Intent {}

class GetIndx extends Intent {
  int index;
  GetIndx(this.index);
}
