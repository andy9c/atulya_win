// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/bloc_observer.dart';
import 'app/view/app.dart';
import 'configuration/configuration.dart';

final globalScaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configurationUpdate();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  await FirebaseAppCheck.instance.activate();

  Bloc.observer = AppBlocObserver();

  // final storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorage.webStorageDirectory
  //       : await getApplicationDocumentsDirectory(),
  // );

  // https://github.com/felangel/bloc/issues/3244
  // issue
  // Storage was accessed before it was initialized.
  // Please ensure that storage has been initialized.
  // https://github.com/felangel/bloc/commit/0a64ee2095e21111eb40a58abd3980383ae25c74#diff-5a9be4b52f331111a058f58d0ba396769521634b64bf913324cc218868a790cf
  //
  //https://github.com/maximveksler/bloc/commit/cfca56d8c00da59289abf58ed95e4e57903696ee

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(App(authenticationRepository: authenticationRepository));

  // HydratedBloc.storage.runZoned(
  //   () => runApp(App(authenticationRepository: authenticationRepository)),
  //   createStorage: () async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     return HydratedStorage.build(
  //       storageDirectory: kIsWeb
  //           ? HydratedStorage.webStorageDirectory
  //           : await getApplicationDocumentsDirectory(),
  //     );
  //   },
  // );

  // HydratedBlocOverrides.runZoned(
  //   () => runApp(App(authenticationRepository: authenticationRepository)),
  //   storage: storage,
  // );

  // runApp(App(authenticationRepository: authenticationRepository));
}
