import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profinder/authentication/data/models/user_model.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial());

  setUser(UserModel user) {
    emit(Authenticated(user: user));
  }
}
