class CharacterClass {
  int? char_id;
  String? name;
  // DateTime? birthday;
  List<dynamic>? jops;
  String? img_url;
  String? status_of_DeadORAlive; //
  String? nick_name;
  List<dynamic>? apperance_of_seasons;
  String? actor_name;
  String? category;
  List<dynamic>? better_call_soul;

  CharacterClass.fromJson(Map<String, dynamic> json) {
    char_id = json['char_id'];
    name = json['name'];
    // birthday = json['birthday'];
    jops = json['occupation'];
    img_url = json['img'];
    status_of_DeadORAlive = json['status'];
    nick_name = json['nickname'];
    apperance_of_seasons = json['appearance'];
    actor_name = json['portrayed'];
    category = json['category'];
    better_call_soul = json['better_call_saul_appearance'];
  }

  CharacterClass({
    required this.char_id,
    required this.name,
    // required this.birthday,
    required this.jops,
    required this.img_url,
    required this.status_of_DeadORAlive,
    required this.nick_name,
    required this.apperance_of_seasons,
    required this.actor_name,
    required this.category,
    required this.better_call_soul,
  });
}
