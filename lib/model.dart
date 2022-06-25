class Model{
  final int userId;
  final int id;
  final String title;
  final String body;

//<editor-fold desc="Data Methods">

  const Model({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Model &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body);

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'Model{ userId: $userId,id: $id, title: $title, body: $body,}';
  }

  Model copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Model(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'body': this.body,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

//</editor-fold>
}