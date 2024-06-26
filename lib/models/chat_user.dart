class ChatUser {
  final String uid;
  final String name;
  final String email;
  final String imageURL;
  late DateTime lastActive;

  ChatUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageURL,
    required this.lastActive,
  });

  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(
      uid: _json['uid'],
      name: _json['name'],
      email: _json['email'],
      imageURL: _json['imageURL'],
      lastActive: _json['lastActive'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'uid': uid,
      'name': name,
      'email': email,
      'imageURL': imageURL,
      'lastActive': lastActive,
    };
  }

  String lastDayActive() {
    return "${lastActive.day}/${lastActive.month}/${lastActive.year}";
  }

  bool wasRecentlyActive() {
    return DateTime.now().difference(lastActive).inHours < 2;
  }
}
