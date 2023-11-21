import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'injection_container.dart';

import 'features/auth/ui/bloc/auth_bloc_imports.dart';
import 'features/auth/ui/views/authentication_view.dart';
import 'features/home/ui/bloc/home_bloc_imports.dart';
import '-config/themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await initDependencies();
  await initHomeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (context) => sl()..add(AuthInitialEvent())),
          BlocProvider<HomeBloc>(
              create: (context) => sl()..add(HomeInitialEvent()))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: "/",
            theme: theme(),
            home: const AuthenticationView()));
  }
}
