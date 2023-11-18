import '../../../../-core/params/default_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/cliente.dart';
import '../repositories/home_repository.dart';

class GetClientes extends UseCase<List<Cliente>, NoParams> {
  final HomeRepository repository;
  GetClientes({required this.repository});
  @override
  Future<List<Cliente>> call(NoParams params) async {
    return await repository.getClientes();
  }
}
