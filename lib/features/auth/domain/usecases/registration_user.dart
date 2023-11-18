import '../../../../-core/params/registration_params.dart';
import '../../../../-core/usecases/usecase.dart';

import '../entities/registration_status.dart';
import '../repositories/registration_repository.dart';

class RegistrationUser
    extends UseCase<RegistrationStatus, RegistrationDataForm> {
  final RegistrationRepository repository;
  RegistrationUser({required this.repository});
  @override
  Future<RegistrationStatus> call(RegistrationDataForm params) async {
    return await repository.createUser(params);
  }
}
