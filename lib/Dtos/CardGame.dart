// ignore_for_file: file_names

class CardGame {
  final int id;
  final String name;
  final String desc;
  final String archetype;
  final String image_url;
  final String image_url_cropped;

  CardGame({
    required this.id,
    required this.name,
    required this.desc,
    required this.archetype,
    required this.image_url,
    required this.image_url_cropped,
  });

  factory CardGame.fromJson(Map<String, dynamic> json) {
    var card =  CardGame(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      archetype: json["archetype"],
      image_url: json["card_images"][0]["image_url"],
      image_url_cropped: json["card_images"][0]["image_url_cropped"],
    );

    return card;
  }
}
