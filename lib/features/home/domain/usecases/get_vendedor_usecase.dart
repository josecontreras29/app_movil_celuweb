import '../../../../-core/params/default_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/vendedor.dart';
import '../repositories/home_repository.dart';

class GetVendedor extends UseCase<Vendedor, NoParams> {
  final HomeRepository repository;
  GetVendedor({required this.repository});
  @override
  Future<Vendedor> call(NoParams params) async {
    return await repository.getVendedor();
  }
}
