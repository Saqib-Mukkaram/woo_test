class Images {
  final int id;
  final String src;

  // Constructor
  const Images({
    required this.id,
    required this.src,
  });

  // fromJson factory method
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      src: json['src'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src,
    };
  }
}
