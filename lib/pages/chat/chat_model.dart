class Chat {
  final String name;
  final String message;
  final String imageUrl;

  const Chat(
      {required this.name, required this.message, required this.imageUrl});

  factory Chat.fromJson(Map json) {
    return Chat(
      name: json["name"],
      message: json["message"],
      imageUrl: json["imageUrl"],
    );
  }
}
