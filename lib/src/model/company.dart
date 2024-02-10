class Company {
  int? id;
  String? name;
  String? description;
  String? businessName;
  String? city;
  String? state;
  String? country;
  String? contact;
  String? email;
  String? postalCode;
  String? document;

  Company({
    this.id,
    this.name,
    this.description,
    this.businessName,
    this.city,
    this.state,
    this.country,
    this.contact,
    this.email,
    this.postalCode,
    this.document,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    businessName = json['business_name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    contact = json['contact'];
    email = json['email'];
    postalCode = json['postal_code'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['business_name'] = businessName;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['contact'] = contact;
    data['email'] = email;
    data['postal_code'] = postalCode;
    data['document'] = document;
    return data;
  }
}
