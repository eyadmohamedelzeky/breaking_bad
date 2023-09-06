class Character {
  int? id;
  String? name;
  String? status;
  String? species;
 late String image;
  List<dynamic>? episode;

  Character.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    image = json['image'];
    episode = json['episode'];
  }
}
