class Chat {
  final String name;
  final String message;
  final String imageUrl;

  const Chat({this.name, this.message, this.imageUrl});

  factory Chat.fromJson(Map json) {
    return Chat(
        name: json["name"],
        message: json["message"],
        imageUrl: json["imageUrl"]);
  }
}
