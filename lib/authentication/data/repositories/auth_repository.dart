import 'package:profinder/authentication/data/models/user_model.dart';
import 'package:profinder/shared/consts.dart';
import 'package:profinder/shared/db_tables.dart';

class AuthRepository {
  Future<UserModel> getUser({
    required String id,
  }) async {
    final res =
        await supabase.from(DbTables.users).select().eq('id', id).single();

    return UserModel.fromJson(res);
  }

  Future<UserModel> upSetUser({
    required Map<String, dynamic> data,
  }) async {
    final res =
        await supabase.from(DbTables.users).upsert(data).select().single();

    return UserModel.fromJson(res);
  }

  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final authResponse = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    final data = {
      'id': authResponse.user?.id,
      "email": authResponse.user?.email,
      "last_name": lastName,
      "first_name": firstName,
      "phone_number": phoneNumber,
    };

    return await upSetUser(data: data);
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var res = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );

    return getUser(id: res.user!.id);
  }
}
