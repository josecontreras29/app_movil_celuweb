import '../../../../-core/params/home_params.dart';
import '../../../../-core/usecases/usecase.dart';
import '../entities/pedido.dart';
import '../repositories/home_repository.dart';

class SaveOrder extends UseCase<SaveOrderResult, Pedido> {
  final HomeRepository repository;
  SaveOrder({required this.repository});
  @override
  Future<SaveOrderResult> call(Pedido params) async {
    return await repository.saveOrder(params);
  }
}
