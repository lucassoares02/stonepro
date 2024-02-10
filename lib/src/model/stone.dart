import 'package:stonepro/src/model/company.dart';
import 'package:stonepro/src/model/remain.dart';

class Stone {
  int? id;
  String? name;
  String? description;
  Company? manufacturer;
  Company? provider;
  String? image;
  List<Remain?>? remains;

  Stone({
    this.id,
    this.name,
    this.description,
    this.manufacturer,
    this.provider,
    this.image,
    this.remains,
  });

  Stone.fromJson(Map<String, dynamic> json) {
    List rem = json['remains'] as List;

    id = json['id'];
    name = json['name'];
    description = json['description'];
    manufacturer = Company.fromJson(json["manufacturer"]);
    provider = Company.fromJson(json["provider"]);
    image = json['image'];
    remains = rem.map((json) => Remain.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['manufacturer'] = manufacturer;
    data['provider'] = provider;
    data['image'] = image;
    data['remains'] = remains;
    return data;
  }
}
