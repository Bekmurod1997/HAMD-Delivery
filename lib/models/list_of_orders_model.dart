class ListOfOrdersModel {
  List<Data> data;

  ListOfOrdersModel({this.data});

  ListOfOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  Courier courier;
  int productTotalSum;
  int productCount;
  String address;
  String mapLocation;
  int status;
  dynamic paymentType;
  DeliveryType deliveryType;
  List<OrderProducts> orderProducts;
  String date;

  Data(
      {this.id,
      this.courier,
      this.productTotalSum,
      this.productCount,
      this.address,
      this.mapLocation,
      this.status,
      this.paymentType,
      this.deliveryType,
      this.orderProducts,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courier =
        json['courier'] != null ? new Courier.fromJson(json['courier']) : null;
    productTotalSum = json['product_total_sum'];
    productCount = json['product_count'];
    address = json['address'];
    mapLocation = json['map_location'];
    status = json['status'];
    paymentType = json['paymentType'];
    deliveryType = json['deliveryType'] != null
        ? new DeliveryType.fromJson(json['deliveryType'])
        : null;
    if (json['orderProducts'] != null) {
      orderProducts = new List<OrderProducts>();
      json['orderProducts'].forEach((v) {
        orderProducts.add(new OrderProducts.fromJson(v));
      });
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.courier != null) {
      data['courier'] = this.courier.toJson();
    }
    data['product_total_sum'] = this.productTotalSum;
    data['product_count'] = this.productCount;
    data['address'] = this.address;
    data['map_location'] = this.mapLocation;
    data['status'] = this.status;
    data['paymentType'] = this.paymentType;
    if (this.deliveryType != null) {
      data['deliveryType'] = this.deliveryType.toJson();
    }
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    return data;
  }
}

class Courier {
  int id;
  String token;
  String language;
  String phone;
  String name;
  String lastname;
  String photo;
  int rating;
  String passportPhoto;
  String driverLicensePhoto;

  Courier(
      {this.id,
      this.token,
      this.language,
      this.phone,
      this.name,
      this.lastname,
      this.photo,
      this.rating,
      this.passportPhoto,
      this.driverLicensePhoto});

  Courier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    language = json['language'];
    phone = json['phone'];
    name = json['name'];
    lastname = json['lastname'];
    photo = json['photo'];
    rating = json['rating'];
    passportPhoto = json['passportPhoto'];
    driverLicensePhoto = json['driverLicensePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['language'] = this.language;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['photo'] = this.photo;
    data['rating'] = this.rating;
    data['passportPhoto'] = this.passportPhoto;
    data['driverLicensePhoto'] = this.driverLicensePhoto;
    return data;
  }
}

class DeliveryType {
  int id;
  String name;
  String description;
  String photo;

  DeliveryType({this.id, this.name, this.description, this.photo});

  DeliveryType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['photo'] = this.photo;
    return data;
  }
}

class OrderProducts {
  int totalSum;
  int count;
  Product product;

  OrderProducts({this.totalSum, this.count, this.product});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    totalSum = json['total_sum'];
    count = json['count'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sum'] = this.totalSum;
    data['count'] = this.count;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  int id;
  String name;
  String description;
  String parameters;
  int price;
  int rating;
  String photo;
  List<Gallery> gallery;

  Product(
      {this.id,
      this.name,
      this.description,
      this.parameters,
      this.price,
      this.rating,
      this.photo,
      this.gallery});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parameters = json['parameters'];
    price = json['price'];
    rating = json['rating'];
    photo = json['photo'];
    if (json['gallery'] != null) {
      gallery = new List<Gallery>();
      json['gallery'].forEach((v) {
        gallery.add(new Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parameters'] = this.parameters;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['photo'] = this.photo;
    if (this.gallery != null) {
      data['gallery'] = this.gallery.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gallery {
  int id;
  String photo;

  Gallery({this.id, this.photo});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    return data;
  }
}
