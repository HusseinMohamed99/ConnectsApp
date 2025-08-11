import 'package:connects_app/core/helpers/dimensions/dimensions.dart';
import 'package:connects_app/core/helpers/extensions/widget_extension.dart';
import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:connects_app/features/users/presentation/pages/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                const Text('My Contact'),
                verticalSpacing(kSpacingLarge),

                Expanded(
                  child: BlocBuilder<UsersCubit, UsersState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () =>
                            const Center(child: CircularProgressIndicator()),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        usersPageLoaded: (page) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            final canScroll =
                                cubit
                                    .scrollController.position.maxScrollExtent > 0;
                            if (!canScroll && cubit.hasMore) {
                              cubit.loadMoreUsers();
                            }
                          });
                          return ListView.separated(
                             physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            separatorBuilder: (context, index) =>
                                verticalSpacing(12),
                            controller: cubit.scrollController,
                            itemCount: page.data.length,
                            itemBuilder: (context, index) {
                              final user = page.data[index];
                              return GlassContainer(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 10.h,
                                ),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.singleUserDetailsView,
                                    arguments: user.id,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 22.r,
                                        backgroundImage: NetworkImage(
                                          user.avatar,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          '${user.firstName} ${user.lastName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
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
                        },
                        userLoaded: (user) => Center(
                          child: Text('${user.firstName} ${user.lastName}'),
                        ),
                        error: (msg) => Center(child: Text('Error: $msg')),
                      );
                    },
                  ),
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
