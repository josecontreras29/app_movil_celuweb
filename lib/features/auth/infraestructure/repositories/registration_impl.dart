import '../../../../-core/params/registration_params.dart';
import '../../domain/entities/registration_status.dart';
import '../../domain/entities/verify_user_registered.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_datasource.dart';

class RegistrationImpl implements RegistrationRepository {
  final RegistrationDataSource localDataSource;

  RegistrationImpl({required this.localDataSource});
  @override
  Future<RegistrationStatus> createUser(RegistrationDataForm userData) async {
    try {
      return await localDataSource.createUser(userData);
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<VerifyUserRegisteredStatus> verifyUserRegistered(UserData user) async{
     try {
      return await localDataSource.verifyUserRegistered(user);
    } catch (error) {
      throw error.toString();
    }
  }
}
