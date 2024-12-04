class FestivalModel {
  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String mainImageUrl;
  final String detailImageUrl;
  final List<String> tags;

  FestivalModel({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.mainImageUrl,
    required this.detailImageUrl,
    required this.tags,
  });

  FestivalModel copyWith({
    String? id,
    String? name,
    String? shortDescription,
    String? description,
    String? mainImageUrl,
    String? detailImageUrl,
    List<String>? tags,
  }) {
    return FestivalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrl: detailImageUrl ?? this.detailImageUrl,
      tags: tags ?? this.tags,
    );
  }
}
