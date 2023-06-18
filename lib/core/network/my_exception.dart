class MyException implements Exception {
  MyException(this._message);

  final String _message;

  @override
  String toString() => "MyException: $_message";

  String get message => _message;
}
