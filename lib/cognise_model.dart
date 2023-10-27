class Welcome {
  String status;
  dynamic message;
  List<Datum> data;

  Welcome({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String icon;
  bool isActive;
  DateTime dateCreated;
  DateTime dateUpdated;

  Datum({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.dateCreated,
    required this.dateUpdated,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    isActive: json["is_active"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateUpdated: DateTime.parse(json["date_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "is_active": isActive,
    "date_created": dateCreated.toIso8601String(),
    "date_updated": dateUpdated.toIso8601String(),
  };
}