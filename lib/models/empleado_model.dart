class Empleado {
  DateTime createdAt;
  String firstname;
  String lastname;
  String email;
  String url;
  String city;
  String country;
  String company;
  String? avatar;
  String details;
  String? phone;
  bool active;
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
    this.avatar,
    required this.details,
    this.phone,
    required this.active,
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
    phone: json["phone"],
    active: json["active"],
    id: json["id"],
  );
}
