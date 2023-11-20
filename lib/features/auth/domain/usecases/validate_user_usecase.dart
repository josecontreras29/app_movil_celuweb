import '../../../../-core/params/login_params.dart';
import '../../../../../-core/usecases/usecase.dart';
import '../entities/validate_user_auth.dart';
import '../repositories/login_repository.dart';

class ValidateUser extends UseCase<ValidateUserAuth, LoginParams> {
  final LoginRepository repository;

  ValidateUser({required this.repository});

  @override
  Future<ValidateUserAuth> call(LoginParams params) async {
    return await repository.validateUser(params);
  }
}
