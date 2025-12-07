class ApiUrl {
  // Base URL - Update this with your actual API base URL
  static const String baseUrl = 'http://192.168.18.254:8080/api';

  // Authentication endpoints
  static const String registrasi = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';

  // Computer/Product endpoints
  static const String listProduk = '$baseUrl/komputer';
  static const String createProduk = '$baseUrl/komputer';

  // Helper methods for dynamic endpoints
  static String updateProduk(int id) => '$baseUrl/komputer/$id';
  static String showProduk(int id) => '$baseUrl/komputer/$id';
  static String deleteProduk(int id) => '$baseUrl/komputer/$id';
}
