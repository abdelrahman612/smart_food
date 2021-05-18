// To parse this JSON data, do
//
//     final resturant = resturantFromJson(jsonString);

import 'dart:convert';

Resturant resturantFromJson(String str) => Resturant.fromJson(json.decode(str));

String resturantToJson(Resturant data) => json.encode(data.toJson());

class Resturant {
  Resturant({
    this.status,
    this.subMessage,
    this.resturantReturn,
    this.message,
  });

  int status;
  String subMessage;
  List<ReturnResurant> resturantReturn;
  String message;

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
    status: json["status"],
    subMessage: json["sub_message"],
    resturantReturn: List<ReturnResurant>.from(json["return"].map((x) => ReturnResurant.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sub_message": subMessage,
    "return": List<dynamic>.from(resturantReturn.map((x) => x.toJson())),
    "message": message,
  };
}

class ReturnResurant {
  ReturnResurant({
    this.restId,
    this.restName,
    this.restImg,
    this.restLocation,
    this.restType,
    this.catId,
    this.rate,
    this.delivery,
    this.open,
    this.close,
    this.products,
  });

  String restId;
  String restName;
  String restImg;
  String restLocation;
  String restType;
  int catId;
  double rate;
  int delivery;
  String open;
  String close;
  List<Product> products;

  factory ReturnResurant.fromJson(Map<String, dynamic> json) => ReturnResurant(
    restId: json["rest_id"],
    restName: json["rest_name"],
    restImg: json["rest_img"],
    restLocation: json["rest_location"],
    restType: json["rest_type"],
    catId: json["cat_id"],
    rate: json["rate"].toDouble(),
    delivery: json["delivery"],
    open: json["open"],
    close: json["close"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rest_id": restId,
    "rest_name": restName,
    "rest_img": restImg,
    "rest_location": restLocation,
    "rest_type": restType,
    "cat_id": catId,
    "rate": rate,
    "delivery": delivery,
    "open": open,
    "close": close,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.prodName,
    this.prodId,
    this.prodPrice,
    this.prodImage,
  });

  String prodName;
  int prodId;
  String prodPrice;
  String prodImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    prodName: json["prod_name"],
    prodId: json["prod_id"],
    prodPrice: json["prod_price"],
    prodImage: json["prod_image"],
  );

  Map<String, dynamic> toJson() => {
    "prod_name": prodName,
    "prod_id": prodId,
    "prod_price": prodPrice,
    "prod_image": prodImage,
  };
}
