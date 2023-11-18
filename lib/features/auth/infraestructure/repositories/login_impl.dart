import '../../../../-core/params/login_params.dart';
import '../../domain/entities/validate_user_auth.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginImpl implements LoginRepository {
  final LoginDataSource localDataSource;

  LoginImpl({required this.localDataSource});

  @override
  Future<ValidateUserAuth> validateUser(LoginParams credentials) async {
    try {
      return await localDataSource.validateUser(credentials);
    } catch (error) {
      throw error.toString();
    }
  }
}
