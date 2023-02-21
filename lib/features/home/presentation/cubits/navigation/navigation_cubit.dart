import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class CustomerNavigationCubit extends Cubit<NavigationState> {
  CustomerNavigationCubit() : super(NavigationState.initial());

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
