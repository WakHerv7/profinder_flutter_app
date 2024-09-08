import 'package:get_it/get_it.dart';
import 'package:profinder/authentication/data/repositories/auth_repository.dart';
import 'package:profinder/shared/business_logic/cubit/application_cubit.dart';

final getIt = GetIt.instance;

setupLocator() {
  getIt.registerSingleton(AuthRepository());
  getIt.registerSingleton(ApplicationCubit());
}
