class UserModel {
  String? username;
  String? email;
  String? phone;
  String? avatarUrl;
  String? address;
  int? age;
  DateTime? dateOfBirth;
  DateTime? createTime;
  UserModel({
    required this.username,
    required this.email,
    required this.createTime,
    this.phone,
    this.address,
    this.avatarUrl,
    this.dateOfBirth,
    this.age,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        age: json["age"],
        phone: json["phone"],
        createTime:
            DateTime.tryParse(json["createTime"] ?? "") ?? DateTime.now(),
        avatarUrl: json["avatarUrl"],
        address: json["address"],
        dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      );
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "avatarUrl": avatarUrl,
        "address": address,
        "age": age,
        "dateOfBirth": dateOfBirth,
        "createTime": createTime,
      };
}
