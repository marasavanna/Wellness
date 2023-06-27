

class PhaseItemDto {
  String description;

 PhaseItemDto({required this.description});

  static PhaseItemDto fromJson(Map<String, dynamic> json) => PhaseItemDto(
    description: json['description'],
  );
}