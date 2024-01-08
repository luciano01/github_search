import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../state/state.dart';

class HomeView extends GetView<UserRepositoryState> {
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
                    controller: controller.textEditingController,
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
                      controller.getUserRepositories();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.getUserRepositories();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return _loadingList();
              } else {
                return _listOfRepositories();
              }
            }),
          ),
        ],
      ),
    );
  }

  Center _initialContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Search repositories by GitHub username.'),
          Text('Ex: luciano01'),
        ],
      ),
    );
  }

  Center _loadingList() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView _listOfRepositories() {
    return ListView.separated(
      itemCount: controller.repositories.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        final repository = controller.repositories[index];
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            repository.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Text(
                        repository.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Language: ${repository.language}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Stars: ${repository.stargazersCount}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Forks: ${repository.forksCount}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
