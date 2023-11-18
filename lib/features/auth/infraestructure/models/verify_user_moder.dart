
import '../../domain/entities/verify_user_registered.dart';

class VerifyUserModel extends VerifyUserRegisteredStatus {
  VerifyUserModel({required super.registered});

  factory VerifyUserModel.fromJson(Map<String, dynamic> json) {
    return VerifyUserModel(registered: json["registered"]);
  }
}