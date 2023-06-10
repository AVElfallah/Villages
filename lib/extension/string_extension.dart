extension Se on String {
  String get toBackendImage {
    return "http://10.0.2.2:8000/imgs/$this";
  }
}
