import '../../../../-core/params/registration_params.dart';
 
import '../entities/registration_status.dart';
import '../entities/verify_user_registered.dart';

abstract class RegistrationRepository {
  Future<RegistrationStatus> createUser(RegistrationDataForm userData);
  Future<VerifyUserRegisteredStatus> verifyUserRegistered(UserData user);
}
