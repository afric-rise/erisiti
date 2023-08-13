part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ValidateLoginTinNumberState extends LoginState {
  final bool valid;
  final String tinNumber;

  ValidateLoginTinNumberState(this.valid, this.tinNumber);
}
