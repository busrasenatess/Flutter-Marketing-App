//TODO: SINGLETON DESIGN PATTERN

class AppConstants {
  static AppConstants? _instance;
  static AppConstants? get instance {
    _instance ??= AppConstants._init();
    return _instance;
  }

  AppConstants._init();

  final String baseUrl = "https://dummyjson.com/products/";
}
