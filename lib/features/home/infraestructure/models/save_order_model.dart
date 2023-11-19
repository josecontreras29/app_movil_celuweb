import '../../../../-core/params/home_params.dart';

class SaveOrderModel extends SaveOrderResult {
  SaveOrderModel({required super.result});

  factory SaveOrderModel.fromJson(Map<String, dynamic> json) {
    return SaveOrderModel(result: json["result"]);
  }
  
}
