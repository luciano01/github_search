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
                      controller.getUserRepositories(userName: value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.getUserRepositories(
                      userName: controller.textEditingController.text,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.repositories.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Search repositories by GitHub username.'),
                      Text('Ex: luciano01'),
                    ],
                  ),
                );
              } else {
                return Visibility(
                  visible: !controller.isLoading,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.separated(
                    itemCount: controller.repositories.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final repository = controller.repositories[index];
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
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
