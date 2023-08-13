import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erisiti/src/features/services/database/modalHelpers/login_user.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../login/Login.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(homeEvent);
    on<LogoutEvent>(logoutEvent);
    on<ConfirmLoginEvent>(confirmLoginEvent);
  }

  FutureOr<void> homeEvent(HomeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<HomeState> emit) {
    emit(LogoutState());
  }

  FutureOr<void> confirmLoginEvent(
      ConfirmLoginEvent event, Emitter<HomeState> emit) {
    print("step 1");
    LoginUserHelper().dropDatabase();
    print("step 2");
    Navigator.pop(event.context);
    print("step 3");
    Navigator.of(event.context).popUntil((route) => route.isFirst);

    Navigator.of(event.context).pushReplacement(MaterialPageRoute(
      builder: (context) => const Login(),
    ));
    print("step 4");
  }
}
