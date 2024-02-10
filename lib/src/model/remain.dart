class Remain {
  int? id;
  String? description;
  String? width;
  String? length;
  List<dynamic>? images;
  String? date;
  int? responsible;
  int? stone;

  Remain({
    this.id,
    this.description,
    this.width,
    this.length,
    this.images,
    this.date,
    this.responsible,
    this.stone,
  });

  Remain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    width = json['width'];
    length = json['length'];
    images = json['images'];
    date = json['date'];
    responsible = json['responsible'];
    stone = json['stone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['width'] = width;
    data['length'] = length;
    data['images'] = images;
    data['date'] = date;
    data['responsible'] = responsible;
    data['stone'] = stone;
    return data;
  }
}
