import 'package:app_movil/-core/datasources/sqlite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../-core/params/login_params.dart';
import '../models/validate_user_model.dart';

abstract class LoginDataSource {
  Future<ValidateUserModel> validateUser(LoginParams loginParams);
}

class LoginDataSourceImpl implements LoginDataSource {
  final ClientSQLite client;
  final SharedPreferences sharedPreferences;
  LoginDataSourceImpl({required this.client, required this.sharedPreferences});
  @override
  Future<ValidateUserModel> validateUser(LoginParams loginParams) async {
    final db = await client.database;
    try {
      final List<Map<String, dynamic>> response = await db.rawQuery(
          "SELECT * FROM Usuario where usuario LIKE '%${loginParams.user}%' AND password LIKE '%${loginParams.password}%'",
          null);

      /// EXAMPLE DELAY
      await Future.delayed(const Duration(milliseconds: 500));
      ValidateUserModel userInfo = ValidateUserModel.fromJson(response[0]);
      await sharedPreferences.setString('username', userInfo.usuario);
      return userInfo;
    } catch (error) {
      throw Exception("$error");
    }
  }
}
