class User {
  String? gender;
  Name? name;
  String? email;
  String? phone;
  String? cell;
  Picture? picture;

  User({
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.cell,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "email": email,
        "phone": phone,
        "cell": cell,
        "picture": picture?.toJson(),
      };

  static List<User>? fromJsonList(List list) {
    return list.map((item) => User.fromJson(item)).toList();
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
