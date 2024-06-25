class Billing {
  final String firstName;
  final String lastName;
  final String company = '';
  final String address;
  final String city;
  final String postcode;
  final String country;
  final String state;
  final String? email;
  final String? phone;

  //ctor
  Billing({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
    this.email,
    this.phone,
  });

  //fromJson
  factory Billing.fromJson(Map<String, dynamic> json) {
    return Billing(
      firstName: json['first_name'],
      lastName: json['last_name'],
      address: json['address_1'],
      city: json['city'],
      postcode: json['postcode'],
      country: json['country'],
      state: json['state'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'company': company,
      'address_1': address,
      'city': city,
      'postcode': postcode,
      'country': country,
      'state': state,
      'email': email,
      'phone': phone,
    };
  }
}
