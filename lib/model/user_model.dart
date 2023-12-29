// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? status;
  List<Datum>? data;

  UserModel({
    this.status,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Datum({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
      };
}
