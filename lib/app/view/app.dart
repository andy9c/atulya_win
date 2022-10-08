import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

import '../../home/cubit/cubit.dart';
import '../../main.dart';
import '../../theme.dart';
import '../app.dart';
import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => InformaticsCubit(),
          ),
          BlocProvider(
            create: (_) => SectionOneCubit(),
          ),
          BlocProvider(
            create: (_) => SectionTwoCubit(),
          ),
          BlocProvider(
            create: (_) => SectionThreeCubit(),
          ),
          BlocProvider(
            create: (_) => SectionFourCubit(),
          ),
          BlocProvider(
            create: (_) => SectionFiveCubit(),
          ),
          BlocProvider(
            create: (_) => SectionSixCubit(),
          ),
          BlocProvider(
            create: (_) => FamilyMemberCubit(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: globalScaffoldMessenger,
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          backgroundColor: const Color(0xFFE0F2F1),
        ),
        theme: theme,
        darkTheme: theme,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      );
    });
  }
}
