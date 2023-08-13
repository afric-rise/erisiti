part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class LogoutEvent extends HomeEvent {}

final class ConfirmLoginEvent extends HomeEvent {
  final BuildContext context;

  ConfirmLoginEvent(this.context);
}
