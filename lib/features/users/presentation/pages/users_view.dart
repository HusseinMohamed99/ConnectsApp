import 'package:connects_app/core/helpers/responsive/spacing.dart';
import 'package:connects_app/core/routing/routes.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            usersPageLoaded: (page) {
              return ListView.separated(
                separatorBuilder: (context, index) => verticalSpacing(100),
                controller: cubit.scrollController, // 📌 هنا رابطناه
                itemCount: page.data.length,
                itemBuilder: (context, index) {
                  final user = page.data[index];
                  return ListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.singleUserDetailsView,
                      arguments: user.id,
                    ),
                  
                  );
                },
              );
            },
            userLoaded: (user) =>
                Center(child: Text('${user.firstName} ${user.lastName}')),
            error: (msg) => Center(child: Text('Error: $msg')),
          );
        },
      ),
    );
  }
}
