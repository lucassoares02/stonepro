class Stone {
  int? id;
  String? name;
  String? description;
  String? manufacturer;
  String? provider;

  Stone({
    this.id,
    this.name,
    this.description,
    this.manufacturer,
    this.provider,
  });

  Stone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    manufacturer = json['manufacturer'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['manufacturer'] = manufacturer;
    data['provider'] = provider;
    return data;
  }
}
