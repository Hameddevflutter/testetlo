import 'dart:convert';

DepartmentModel departmentFromJson(String str) =>
    DepartmentModel.fromJson(json.decode(str));

String departmentToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  final int id;
  final String name;
  final String details;
  final String icon;
  final bool isActive;
  final String color;
  final String backgroundItem;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.details,
    required this.icon,
    required this.isActive,
    required this.color,
    required this.backgroundItem,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        icon: json["icon"],
        isActive: json["is_active"],
        color: json["color"],
        backgroundItem: json["background_item"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "icon": icon,
        "is_active": isActive,
        "color": color,
        "background_item": backgroundItem,
      };
}
