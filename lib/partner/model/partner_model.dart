class PartnerModel {
  final String id;
  final String name;
  final String job;
  final String shortDescription;
  final String description;
  final String mainImageUrl;
  final String detailImageUrl;
  final List<String> tags;

  PartnerModel({
    required this.id,
    required this.name,
    required this.job,
    required this.shortDescription,
    required this.description,
    required this.mainImageUrl,
    required this.detailImageUrl,
    required this.tags,
  });

  PartnerModel copyWith({
    String? id,
    String? name,
    String? job,
    String? shortDescription,
    String? description,
    String? mainImageUrl,
    String? detailImageUrl,
    List<String>? tags,
  }) {
    return PartnerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrl: detailImageUrl ?? this.detailImageUrl,
      tags: tags ?? this.tags,
    );
  }
}
