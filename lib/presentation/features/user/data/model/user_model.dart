class UserModel {
  UserModel({
    required this.username,
    this.age,
    this.dateOfBirth,
    this.avatarUrl,
    required this.createTime,
    required this.email,
    this.phone,
    this.address,
  });

  String? username;
  DateTime? dateOfBirth;
  DateTime createTime;
  String? email;
  String? phone;
  String? avatarUrl;
  int? age;
  String? address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        age: json["age"],
        phone: json["phone"],
        createTime:
            DateTime.tryParse(json["createTime"] ?? "") ?? DateTime.now(),
        avatarUrl: json["avatarUrl"],
        email: json["email"],
        dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "age": age,
        "address": address,
        "phone": phone,
        "avatarUrl": avatarUrl,
        "email": email,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "createTime": createTime.toIso8601String(),
      };
}
