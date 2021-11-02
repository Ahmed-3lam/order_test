class OrderModel {
  OrderModel({
      this.id, 
      this.isActive, 
      this.price, 
      this.company, 
      this.picture, 
      this.buyer, 
      this.tags, 
      this.status, 
      this.registered,});

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    status = json['status'];
    registered = json['registered'];
  }
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['isActive'] = isActive;
    map['price'] = price;
    map['company'] = company;
    map['picture'] = picture;
    map['buyer'] = buyer;
    map['tags'] = tags;
    map['status'] = status;
    map['registered'] = registered;
    return map;
  }

}