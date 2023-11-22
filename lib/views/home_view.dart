import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GitHub Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: context
                        .read<UserRepositoryBloc>()
                        .textEditingController,
                    textInputAction: TextInputAction.search,
                    cursorColor: Colors.grey.shade900,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Search by username',
                    ),
                    onFieldSubmitted: (value) {
                      final userRepositoryBloc =
                          context.read<UserRepositoryBloc>();
                      userRepositoryBloc.add(
                        UserRepositories(
                          userRepositoryBloc.textEditingController.text,
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final userRepositoryBloc =
                        context.read<UserRepositoryBloc>();
                    userRepositoryBloc.add(
                      UserRepositories(
                        userRepositoryBloc.textEditingController.text,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<UserRepositoryBloc, UserRepositoryState>(
              listener: (context, state) {
                if (state is UserRepositoryError) {
                  SnackBar(
                    content: Text(state.message),
                  );
                }
              },
              builder: (context, state) {
                if (state is UserRepositoryInitial) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Search repositories by GitHub username.'),
                        Text('Ex: luciano01'),
                      ],
                    ),
                  );
                } else if (state is UserRepositoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserRepositoryLoaded) {
                  return ListView.separated(
                    itemCount: state.repositories.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final repository = state.repositories[index];
                      return ListTile(
                        title: Text(repository.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repository.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Language: ${repository.language}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Stars: ${repository.stargazersCount}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Forks: ${repository.forksCount}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.share_outlined),
                          onPressed: () {},
                        ),
                      );
                    },
                  );
                } else if (state is UserRepositoryError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
