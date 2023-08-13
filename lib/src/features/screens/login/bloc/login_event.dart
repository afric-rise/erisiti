part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class ValidateLoginTinNumberEvent extends LoginEvent {
  final String tinNumber;

  ValidateLoginTinNumberEvent(this.tinNumber);
}

final class LoginProcessEvent extends LoginEvent {
  final String tinNumber;
  final String password;
  final BuildContext context;

  LoginProcessEvent(this.tinNumber, this.password, this.context);
}
