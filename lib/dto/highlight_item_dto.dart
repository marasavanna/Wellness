class HighlightItemDto {
  String id;
  String iconPath;
  String name;

  HighlightItemDto(
      {required this.id, required this.iconPath, required this.name});

  static HighlightItemDto fromJson(Map<String, dynamic> json) =>
      HighlightItemDto(
        id: '',
        iconPath: json['iconPath'],
        name: json['name'],
      );
}
