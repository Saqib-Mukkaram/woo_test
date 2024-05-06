class Tags{
  final int id;
  final String name;
  final String slug;
  //constructor
  Tags({
    required this.id,
    required this.name,
    required this.slug
  });

  //from json
  factory Tags.fromJson(Map<String, dynamic> json){
    return Tags(
      id: json['id'],
      name: json['name'],
      slug: json['slug']
    );
  }

}