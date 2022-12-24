class ApiException {
  String message;
  int statusCode;

  ApiException({required this.statusCode, required this.message});
}