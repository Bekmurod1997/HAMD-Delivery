class DetailsOfOrdersModel {
  Data data;

  DetailsOfOrdersModel({this.data});

  DetailsOfOrdersModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int productTotalSum;
  int productCount;
  String address;
  String mapLocation;
  int status;
  PaymentType paymentType;
  PaymentType deliveryType;
  List<OrderProducts> orderProducts;

  Data(
      {this.id,
      this.productTotalSum,
      this.productCount,
      this.address,
      this.mapLocation,
      this.status,
      this.paymentType,
      this.deliveryType,
      this.orderProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTotalSum = json['product_total_sum'];
    productCount = json['product_count'];
    address = json['address'];
    mapLocation = json['map_location'];
    status = json['status'];
    paymentType = json['paymentType'] != null
        ? new PaymentType.fromJson(json['paymentType'])
        : null;
    deliveryType = json['deliveryType'] != null
        ? new PaymentType.fromJson(json['deliveryType'])
        : null;
    if (json['orderProducts'] != null) {
      orderProducts = new List<OrderProducts>();
      json['orderProducts'].forEach((v) {
        orderProducts.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_total_sum'] = this.productTotalSum;
    data['product_count'] = this.productCount;
    data['address'] = this.address;
    data['map_location'] = this.mapLocation;
    data['status'] = this.status;
    if (this.paymentType != null) {
      data['paymentType'] = this.paymentType.toJson();
    }
    if (this.deliveryType != null) {
      data['deliveryType'] = this.deliveryType.toJson();
    }
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentType {
  int id;
  String name;
  String description;
  String photo;

  PaymentType({this.id, this.name, this.description, this.photo});

  PaymentType.fromJson(Map<String, dynamic> json) {
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
  String photo;
  List<Gallery> gallery;

  Product(
      {this.id,
      this.name,
      this.description,
      this.parameters,
      this.price,
      this.photo,
      this.gallery});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parameters = json['parameters'];
    price = json['price'];
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
