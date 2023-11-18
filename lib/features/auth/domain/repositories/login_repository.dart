import '../../../../-core/params/login_params.dart';
import '../entities/validate_user_auth.dart';

abstract class LoginRepository {
  Future<ValidateUserAuth> validateUser(LoginParams credentials);
}
