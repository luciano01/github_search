class UserRepositoryModel {
  String name;
  String htmlUrl;
  String description;
  int stargazersCount;
  String language;
  int forksCount;

  UserRepositoryModel({
    required this.name,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
    required this.language,
    required this.forksCount,
  });

  factory UserRepositoryModel.fromJson(Map<String, dynamic> json) =>
      UserRepositoryModel(
        name: json["name"] ?? '-',
        htmlUrl: json["html_url"] ?? '-',
        description: json["description"] ?? '-',
        stargazersCount: json["stargazers_count"] ?? 0,
        language: json["language"] ?? '-',
        forksCount: json["forks_count"] ?? 0,
      );

  static List<UserRepositoryModel> fromJsonList(List list) {
    return list.map((value) => UserRepositoryModel.fromJson(value)).toList();
  }
}
