import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/ui/bloc/bloc.dart';
import 'features/home/ui/bloc/bloc.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '-config/themes/app_themes.dart';
import 'features/auth/ui/views/authentication_view.dart';
import 'injection_container.dart';

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
              create: (context) => sl()..add(InitialEventAuth())),
          BlocProvider<HomeBloc>(
              create: (context) => sl()..add(GetInitialDataEvent()))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme(),
            home: const AuthenticationView()));
  }
}
