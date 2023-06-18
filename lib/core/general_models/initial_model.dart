class InitModel {
  InitModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });
  factory InitModel.fromJson(final Map<String, dynamic> element) => InitModel(
        status: element["status"] == null || element["status"] == ""
            ? null
            : element['status'],
        message: element["message"] == null || element["message"] == ""
            ? null
            : element['message'],
        code: element["code"] == null || element["code"] == ""
            ? null
            : element['code'],
        data: element['data'],
      );
  final String? status;
  final String? message;
  final num? code;
  final dynamic data;
}
