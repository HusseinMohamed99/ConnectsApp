import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:connects_app/features/users/presentation/pages/widgets/users_list_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    return Scaffold(
      body: SafeArea(
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Contact',
                  style: AppTextStyleManager.semibold16(context),
                ),
                verticalSpacing(kSpacingLarge),
                Expanded(
                  child: UsersListBlocBuilder(cubit: cubit),
                ),
              ],
            ).allPadding(
              vPadding: kPaddingDefaultVertical,
              hPadding: kPaddingDefaultHorizontal,
            ),
      ),
    );
  }
}

