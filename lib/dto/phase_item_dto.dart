

class PhaseItemDto {
  String description;
  String backgroundColor;
  String accentColor;
  String name;

 PhaseItemDto({required this.description, required this.backgroundColor, required this.accentColor, required this.name});

  static PhaseItemDto fromJson(Map<String, dynamic> json) => PhaseItemDto(
    name: json['name'],
    description: json['description'],
    backgroundColor: json['backgroundColor'],
    accentColor: json['accentColor'],
  );
}