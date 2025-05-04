import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent {}

class TabChanged extends NavigationEvent {
  final int index;
  TabChanged(this.index);
}

class NavigationState {
  final int currentIndex;
  NavigationState({required this.currentIndex});
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentIndex: 0)) {
    on<TabChanged>((event, emit) {
      emit(NavigationState(currentIndex: event.index));
    });
  }
}
