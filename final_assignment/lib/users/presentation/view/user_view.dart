import 'package:Busx/users/presentation/viewmodel/user_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userViewModelProvider);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (_scrollController.position.extentAfter == 0) {
            ref.read(userViewModelProvider.notifier).getAllUsers();
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(userViewModelProvider.notifier).resetState();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: Colors.green,
          backgroundColor: Colors.amberAccent,
          onRefresh: () async {
            ref.read(userViewModelProvider.notifier).resetState();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  controller: _scrollController,
                  itemCount: state.lstUsers.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final user = state.lstUsers[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.image != ""
                            ? "http://192.168.137.1:8000/uploads/${user.image}"
                            : 'https://picsum.photos/200'),
                      ),
                      title: Text(user.fullName),
                      subtitle: Text('${user.email}\n${user.phone}'),
                      isThreeLine: true,
                    );
                  },
                ),
              ),
              if (state.isLoading)
                const CircularProgressIndicator(color: Colors.red),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
