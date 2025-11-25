class Empleado {
  DateTime createdAt;
  String firstname;
  String lastname;
  String email;
  String url;
  String city;
  String country;
  String company;
  String avatar;
  String details;
  String id;

  Empleado({
    required this.createdAt,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.url,
    required this.city,
    required this.country,
    required this.company,
    required this.avatar,
    required this.details,
    required this.id,
  });

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
    createdAt: DateTime.parse(json["createdAt"]),
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    url: json["url"],
    city: json["city"],
    country: json["country"],
    company: json["company"],
    avatar: json["avatar"],
    details: json["details"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "url": url,
    "city": city,
    "country": country,
    "company": company,
    "avatar": avatar,
    "details": details,
    "id": id,
  };
}
