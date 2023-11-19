import '../../../../-core/datasources/sqlite.dart';
import '../../../../-core/params/registration_params.dart';
import '../models/registration_model.dart';
import '../models/verify_user_moder.dart';

abstract class RegistrationDataSource {
  Future<RegistrationModel> createUser(RegistrationDataForm registration);
  Future<VerifyUserModel> verifyUserRegistered(UserData registration);
}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  final ClientSQLite client;

  RegistrationDataSourceImpl({required this.client});
  @override
  Future<RegistrationModel> createUser(
      RegistrationDataForm registration) async {
    final db = await client.database;
    try {
      await db.insert('Usuario', {
        "usuario": registration.usuario,
        "password": registration.password,
        "empresa": registration.empresa
      });
      await db.insert('Vendedor', {
        "codigo": registration.usuario,
      });
      await Future.delayed(const Duration(milliseconds: 500));
      return RegistrationModel.fromJson({"created": true});
    } catch (error) {
      throw Exception("$error");
    }
  }

  @override
  Future<VerifyUserModel> verifyUserRegistered(UserData user) async {
    final db = await client.database;
    try {
      final userFound = await db.rawQuery(
          "SELECT Usuario.usuario FROM Usuario WHERE Usuario.usuario = '${user.usuario}'");
      await Future.delayed(const Duration(milliseconds: 500));
      return VerifyUserModel.fromJson({"registered": userFound.isNotEmpty});
    } catch (error) {
      throw Exception("$error");
    }
  }
}
