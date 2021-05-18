import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.status,
    this.subMessage,
    this.categoriesReturn,
    this.message,
  });

  int status;
  String subMessage;
  List<Return> categoriesReturn;
  String message;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    status: json["status"],
    subMessage: json["sub_message"],
    categoriesReturn: List<Return>.from(json["return"].map((x) => Return.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sub_message": subMessage,
    "return": List<dynamic>.from(categoriesReturn.map((x) => x.toJson())),
    "message": message,
  };
}

class Return {
  Return({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Return.fromJson(Map<String, dynamic> json) => Return(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
