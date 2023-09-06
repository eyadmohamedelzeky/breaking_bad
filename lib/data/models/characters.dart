class Character {
  int? id;
 late String name;
 late String status;
 late String species;
 late String image;
  List<dynamic>? episode;
   String ? gender;

  Character.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    image = json['image'];
    episode = json['episode'];
    gender=json['gender'];
  }
}
