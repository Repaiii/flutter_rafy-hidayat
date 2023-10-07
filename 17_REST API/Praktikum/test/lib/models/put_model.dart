class Put {
  final int id;
  final String title;
  final String body;
  final int userId;

  Put(url, {
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}