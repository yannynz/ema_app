class Tip {
  final String tipId;
  final String title;
  final String body;
  Tip({required this.tipId, required this.title, required this.body});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      tipId: json['tipId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
