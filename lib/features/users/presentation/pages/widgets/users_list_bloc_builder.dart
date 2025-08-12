import 'package:connects_app/core/helpers/enum/enum.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:connects_app/core/widgets/errors/custom_error_widget.dart';
import 'package:connects_app/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:connects_app/features/users/presentation/pages/widgets/users_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListBlocBuilder extends StatelessWidget {
  const UsersListBlocBuilder({super.key, required this.cubit});

  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CustomLoader(type: LoaderType.wave),
          loading: () => const CustomLoader(type: LoaderType.wave),
          usersPageLoaded: (page) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final canScroll =
                  cubit.scrollController.position.maxScrollExtent > 0;
              if (!canScroll && cubit.hasMore) {
                cubit.loadMoreUsers();
              }
            });
            return UsersListView(page: page, cubit: cubit);
          },
          userLoaded: (user) => Text(
            '${user.firstName} ${user.lastName}',
            style: AppTextStyleManager.regular16(context),
          ).center(),
          error: (msg) => CustomErrorTextWidget(
            errorMessage: msg,
            onRetry: () {
              cubit.loadUsersPage(1);
            },
          ),
        );
      },
    );
  }
}
