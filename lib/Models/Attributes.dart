class Attributes {
  final int id;
  final String name;
  final String option;

  // Constructor
  const Attributes({
    required this.id,
    required this.name,
    required this.option,
  });

  // fromJson factory method
  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      id: json['id'],
      name: json['name'],
      option: json['option'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'option': option,
    };
  }
}