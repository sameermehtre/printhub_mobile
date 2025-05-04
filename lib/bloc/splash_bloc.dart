import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

abstract class SplashEvent {}

class CheckNavigationEvent extends SplashEvent {}

abstract class SplashState {}

class SplashInitial extends SplashState {}

class NavigateToOnboarding extends SplashState {}

class NavigateToHome extends SplashState {}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckNavigationEvent>((event, emit) {
      final box = GetStorage();
      bool? hasSeenOtpVerification = box.read('otp_verification_screen_show');
      if (hasSeenOtpVerification == true) {
        emit(NavigateToHome());
      } else {
        emit(NavigateToOnboarding());
      }
    });
  }
}
