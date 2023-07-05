import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/tab_screen.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:flutter_tasks_app/services/app_theme.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:flutter_tasks_app/Models/task.dart';

import 'Blocs/bloc.exports.dart';

//  recycle bin done ! now start with change theme with switchs
//
void main() async {
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )),
      storage: storage);
}

class HydratedBlocOverrides {
  static void runZoned(void Function() param0, {required storage}) {}
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TasksBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter To DO  App',
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
              home: const TabScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
