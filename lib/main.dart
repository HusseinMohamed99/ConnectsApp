import 'package:bloc/bloc.dart';
import 'package:connects_app/bloc_observer.dart';
import 'package:connects_app/core/di/dependency_injection.dart';
import 'package:connects_app/core/routing/app_router.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouters();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Connects App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: const Color.fromRGBO(247, 249, 252, 1),
            ),
            initialRoute: Routes.usersView,
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      },
    );
  }
}
