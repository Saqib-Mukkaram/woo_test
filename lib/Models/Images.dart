
class Images{
  final int id;
  final String src;

  //constructor
  Images({
    required this.id,
    required this.src
  });

  //fromjson
  factory Images.fromJson(Map<String, dynamic> json){
    return Images(
      id: json['id'],
      src: json['src']
    );
  }
}