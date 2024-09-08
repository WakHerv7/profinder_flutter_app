import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profinder/authentication/data/models/user_model.dart';
import 'package:profinder/authentication/data/repositories/auth_repository.dart';
import 'package:profinder/shared/utils/utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  AuthCubit({
    required this.repository,
  }) : super(AuthInitial());

  register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());
      final user = await repository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      emit(RegisterSuccess(user: user));
    } catch (e) {
      emit(
        RegisterFailure(message: Utils.extractErrorMessage(e)),
      );
    }
  }

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      final user = await repository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(
        LoginFailure(message: Utils.extractErrorMessage(e)),
      );
    }
  }
}
