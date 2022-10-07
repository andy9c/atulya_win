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

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(App(authenticationRepository: authenticationRepository)),
    storage: storage,
  );

  // runApp(App(authenticationRepository: authenticationRepository));
}
