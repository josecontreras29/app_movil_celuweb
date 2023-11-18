import '../../domain/entities/validate_user_auth.dart';

class ValidateUserModel extends ValidateUserAuth {
  ValidateUserModel(
      {required super.usuario,
      required super.password,
      required super.empresa});

  factory ValidateUserModel.fromJson(Map<String, dynamic> json) {
    return ValidateUserModel(
        usuario: json["usuario"],
        password: json["password"],
        empresa: json["empresa"]);
  }
}
