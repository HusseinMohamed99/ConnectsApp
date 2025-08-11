// features/users/presentation/pages/user_details_page.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connects_app/features/users/presentation/cubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User #$userId')),
      body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Error: $msg')),
            loaded: (u) => ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Avatar
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: CachedNetworkImageProvider(u.avatar),
                  ),
                ),
                const SizedBox(height: 16),
                // Name
                Center(
                  child: Text(
                    '${u.firstName} ${u.lastName}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 8),
                // Email
                Center(child: Text(u.email)),
              ],
            ),
          );
        },
      ),
    );
  }
}
