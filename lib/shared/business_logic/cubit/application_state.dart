part of 'application_cubit.dart';

@immutable
sealed class ApplicationState {
  final UserModel? user;
  const ApplicationState({this.user});
}

final class ApplicationInitial extends ApplicationState {}

final class Authenticated extends ApplicationState {
  const Authenticated({required super.user});
}
