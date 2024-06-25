class Shipping {
  final String firstName;
  final String lastName;
  final String address;
  final String city;
  final String postcode;
  final String country;

  //constructor
  Shipping({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.city,
    required this.postcode,
    required this.country,
  });

  //fromJson
  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      firstName: json['first_name'],
      lastName: json['last_name'],
      address: json['address_1'],
      city: json['city'],
      postcode: json['postcode'],
      country: json['country'],
    );
  }

  //Tojson
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'address_1': address,
      'city': city,
      'postcode': postcode,
      'country': country,
    };
  }
}
