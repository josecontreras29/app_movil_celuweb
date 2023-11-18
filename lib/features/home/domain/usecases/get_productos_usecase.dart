
import '../../../../-core/params/default_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/producto.dart';
import '../repositories/home_repository.dart';

class GetProductos extends UseCase<List<Producto>, NoParams> {
  final HomeRepository repository;
  GetProductos({required this.repository});
  @override
  Future<List<Producto>> call(NoParams params) async {
    return await repository.getProductos();
  }
}