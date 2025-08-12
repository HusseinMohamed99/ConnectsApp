import 'package:connects_app/core/di/dependency_injection.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:connects_app/core/widgets/errors/custom_error_widget.dart';
import 'package:connects_app/features/users/presentation/cubit/user_details_cubit.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:connects_app/features/users/presentation/pages/user_details_view.dart';
import 'package:connects_app/features/users/presentation/pages/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.usersView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<UsersCubit>()..loadUsersPage(2),
            child: const UsersView(),
          ),
        );
      case Routes.singleUserDetailsView:
        final id = settings.arguments as int?;
        if (id == null) {
          return _errorRoute();
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<UserDetailsCubit>()..load(id),
            child: UserDetailsPage(userId: id),
          ),
        );

      default:
        return null;
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const CustomErrorTextWidget(
        errorMessage: 'Page not found or invalid arguments',
      ),
    );
  }
}
