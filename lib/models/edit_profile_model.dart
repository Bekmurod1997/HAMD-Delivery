class EditProfileModel {
  Data data;

  EditProfileModel({this.data});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
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
  String token;
  String phone;
  String name;
  String photo;

  Data({this.id, this.token, this.phone, this.name, this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    phone = json['phone'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}
