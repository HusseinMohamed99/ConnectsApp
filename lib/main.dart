import 'package:connects_app/core/di/dependency_injection.dart';
import 'package:connects_app/core/routing/app_router.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ إضافة المكتبة

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouters();

    return ScreenUtilInit(
      // ✅ تهيئة ScreenUtil
      designSize: const Size(
        375,
        812,
      ), // المقاس المرجعي للتصميم (مثال: iPhone X)
      minTextAdapt: true, // تعديل النصوص تلقائياً
      splitScreenMode: true, // دعم الـ split screen
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Connects App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color.fromRGBO(247, 249, 252, 1),
          ),
          initialRoute: Routes.usersView,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
