part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ValidateTinNumberState extends RegisterState {
  final bool valid;

  ValidateTinNumberState(this.valid);
}

final class ValidateUserAccountState extends RegisterState {
  final bool valid;

  ValidateUserAccountState(this.valid);
}

final class ValidatePasswordState extends RegisterState {
  final bool valid;

  ValidatePasswordState(this.valid);
}

final class ValidatePasswordMatchState extends RegisterState {
  final bool valid;

  ValidatePasswordMatchState(this.valid);
}

final class StoredUserState extends RegisterState {
  final List<bool?> validity;

  StoredUserState(this.validity);
}

final class RegistrationState extends RegisterState {
  final Map result;

  RegistrationState(this.result);
}
