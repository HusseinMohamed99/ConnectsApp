import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/extensions/navigation_extension.dart';
import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:connects_app/core/theming/styleManager/text_style.dart';
import 'package:connects_app/core/widgets/images/custom_smart_circle_avatar.dart';
import 'package:connects_app/features/users/domain/entities/users_page_entity.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:connects_app/features/users/presentation/pages/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key, required this.page, required this.cubit});
  final UsersPageEntity page;
final UsersCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      separatorBuilder: (context, index) => verticalSpacing(kSpacingMedium),
      controller: cubit.scrollController,
      itemCount: page.data.length,
      itemBuilder: (context, index) {
        final user = page.data[index];
        return GlassContainer(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingMediumHorizontal.w,
            vertical: kPaddingMediumVertical.h,
          ),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              Routes.singleUserDetailsView,
              arguments: user.id,
            ),
            child: Row(
              children: [
                SmartCircleAvatar(image: user.avatar, radius: 22.r),
                horizontalSpacing(kSpacingMedium),
                Expanded(
                  child: Text(
                    '${user.firstName} ${user.lastName}',
                    style: AppTextStyleManager.regular16(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
