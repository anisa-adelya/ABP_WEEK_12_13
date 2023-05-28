import 'dart:convert';

class Post {
  final String title;
  final String body;

  const Post({
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
    );
  }
}

//list
List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
