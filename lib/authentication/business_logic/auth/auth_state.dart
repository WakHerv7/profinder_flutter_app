part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  final UserModel? user;
  const AuthState({this.user});

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String message;
  const RegisterFailure({required this.message});
}

final class RegisterSuccess extends AuthState {
  const RegisterSuccess({required super.user});
}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;
  const LoginFailure({required this.message});
}

final class LoginSuccess extends AuthState {
  const LoginSuccess({required super.user});
}
