class ReviewModel {
  final String id;
  final String date;
  final String content;

  ReviewModel({
    required this.id,
    required this.date,
    required this.content,
  });

  ReviewModel copyWith({
    String? id,
    String? date,
    String? content,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }
}
