import 'dart:io';

class Endpoints {
  factory Endpoints() => _g;

  Endpoints._internal();
  static final Endpoints _g = Endpoints._internal();

  static const String baseUrl = "https://majiddeveloper.ir/upload/etlo/";

  // receiveTimeout
  static const int receiveTimeout = 0;

  // connectTimeout
  static const int connectionTimeout = 30 * 1000;

  // send timeout
  static const int sendTimeout = 0;

  static const Map<String, String> defaultHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
