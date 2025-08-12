import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/enum/enum.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:connects_app/core/widgets/errors/custom_error_widget.dart';
import 'package:connects_app/core/widgets/images/custom_smart_circle_avatar.dart';
import 'package:connects_app/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:connects_app/features/users/presentation/cubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: AppTextStyleManager.semibold16(context)),
      ),
      body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const CustomLoader(type: LoaderType.wave),
            error: (msg) => CustomErrorTextWidget(
              errorMessage: msg,
              onRetry: () => context.read<UserDetailsCubit>().load(userId),
            ),
            loaded: (user) => ListView(
              padding: EdgeInsets.symmetric(
                horizontal: kPaddingDefaultHorizontal.w,
                vertical: kPaddingDefaultVertical.h,
              ),
              children: [
                // Avatar
                SmartCircleAvatar(image: user.avatar, radius: 48.r).center(),
                verticalSpacing(kSpacingDefault),
                // Name
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: AppTextStyleManager.mediumTextBlack16(context),
                ).center(),
                verticalSpacing(kSpacingSmall),
                // Email
                Text(
                  user.email,
                  style: AppTextStyleManager.regularTextGrey12(context),
                ).center(),
              ],
            ),
          );
        },
      ),
    );
  }
}
