part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class SubmitUserRegistrationEvent extends RegisterEvent {
  final String password;
  final String tinNumber;
  final String userAccount;

  SubmitUserRegistrationEvent(this.password, this.tinNumber, this.userAccount);
}

final class ValidateTinNumberEvent extends RegisterEvent {
  final String tinNumber;

  ValidateTinNumberEvent(this.tinNumber);
}

final class ValidateAccountEvent extends RegisterEvent {
  final String userAccount;
  ValidateAccountEvent(this.userAccount);
}

final class ValidatePasswordEvent extends RegisterEvent {
  final String password;

  ValidatePasswordEvent(this.password);
}

final class ValidatePasswordMatchEvent extends RegisterEvent {
  final String password;
  final String passwordConfirm;

  ValidatePasswordMatchEvent(this.password, this.passwordConfirm);
}

final class StoreStateEvent extends RegisterEvent {
  final List<bool?> validity;
  StoreStateEvent(this.validity);
}

final class RegistrationEvent extends RegisterEvent {
  final String tinNumber;
  final String account;
  final String password;
  final String passwordConfirm;

  RegistrationEvent(
      this.tinNumber, this.account, this.password, this.passwordConfirm);
}
