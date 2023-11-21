import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '-core/datasources/sqlite.dart';
import 'features/auth/domain/repositories/login_repository.dart';
import 'features/auth/domain/repositories/registration_repository.dart';
import 'features/auth/domain/usecases/validate_user_usecase.dart';
import 'features/auth/domain/usecases/registration_user_usecase.dart';
import 'features/auth/domain/usecases/verify_user_usecase.dart';
import 'features/auth/infraestructure/datasource/login_datasource.dart';
import 'features/auth/infraestructure/datasource/registration_datasource.dart';
import 'features/auth/infraestructure/repositories/login_impl.dart';
import 'features/auth/infraestructure/repositories/registration_impl.dart';
import 'features/auth/ui/bloc/auth_bloc.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_clientes_usecase.dart';
import 'features/home/domain/usecases/get_productos_usecase.dart';
import 'features/home/domain/usecases/get_vendedor_usecase.dart';
import 'features/home/domain/usecases/save_order_usecase.dart';
import 'features/home/infraestructure/datasource/home_datasource.dart';
import 'features/home/infraestructure/repositories/home_impl.dart';
import 'features/home/ui/bloc/home_bloc_imports.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // SQLITE
  sl.registerSingleton<ClientSQLite>(ClientSQLite());
  // SharedPreferences
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // Dependencies
  sl.registerSingleton<LoginDataSource>(
      LoginDataSourceImpl(client: sl(), sharedPreferences: sl()));
  sl.registerSingleton<RegistrationDataSource>(
      RegistrationDataSourceImpl(client: sl()));

  sl.registerSingleton<LoginRepository>(LoginImpl(localDataSource: sl()));
  sl.registerSingleton<RegistrationRepository>(
      RegistrationImpl(localDataSource: sl()));

  // UseCases
  sl.registerSingleton<ValidateUser>(ValidateUser(repository: sl()));
  sl.registerSingleton<RegistrationUser>(RegistrationUser(repository: sl()));
  sl.registerSingleton<VerifyUser>(VerifyUser(repository: sl()));

  // Blocs
  sl.registerSingleton<AuthBloc>(
      AuthBloc(validateUser: sl(), registrationUser: sl(), verifyUser: sl()));
}

Future<void> initHomeDependencies() async {
  // Dependencies
  sl.registerSingleton<HomeDataSource>(
      HomeDataSourceImpl(client: sl(), sharedPreferences: sl()));

  sl.registerSingleton<HomeRepository>(HomeImpl(remoteDataSource: sl()));

// UseCases
  sl.registerSingleton<GetVendedor>(GetVendedor(repository: sl()));
  sl.registerSingleton<GetClientes>(GetClientes(repository: sl()));
  sl.registerSingleton<GetProductos>(GetProductos(repository: sl()));
  sl.registerSingleton<SaveOrder>(SaveOrder(repository: sl()));
  // Blocs
  sl.registerSingleton<HomeBloc>(HomeBloc(
      getVendedor: sl(),
      getClientes: sl(),
      getProductos: sl(),
      saveOrder: sl()));
}
