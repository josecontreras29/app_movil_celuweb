import '../../../../-core/params/registration_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/verify_user_registered.dart';
import '../repositories/registration_repository.dart';

class VerifyUser extends UseCase<VerifyUserRegisteredStatus, UserData> {
  final RegistrationRepository repository;
  VerifyUser({required this.repository});
  @override
  Future<VerifyUserRegisteredStatus> call(UserData params) async {
    return await repository.verifyUserRegistered(params);
  }
}
