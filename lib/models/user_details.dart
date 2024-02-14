// // To parse this JSON data, do
// //
// //     final userData = userDataFromJson(jsonString);

// import 'dart:convert';

// UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

// String userDataToJson(UserData data) => json.encode(data.toJson());

// class UserData {
//   bool success;
//   Data data;

//   UserData({
//     required this.success,
//     required this.data,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   int userId;
//   String name;
//   String email;
//   String mobile;
//   DateTime dob;
//   String occupation;

//   Data({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.dob,
//     required this.occupation,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         userId: json["user_id"],
//         name: json["name"],
//         email: json["email"],
//         mobile: json["mobile"],
//         dob: DateTime.parse(json["dob"]),
//         occupation: json["occupation"],
//       );

//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "name": name,
//         "email": email,
//         "mobile": mobile,
//         "dob": dob.toIso8601String(),
//         "occupation": occupation,
//       };
// }

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  bool success;
  Data data;

  UserData({
    required this.success,
    required this.data,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  int userId;
  String name;
  String email;
  String mobile;
  DateTime dob;
  String occupation;

  Data({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.dob,
    required this.occupation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        dob: DateTime.parse(json["dob"]),
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "dob": dob.toIso8601String(),
        "occupation": occupation,
      };
}
