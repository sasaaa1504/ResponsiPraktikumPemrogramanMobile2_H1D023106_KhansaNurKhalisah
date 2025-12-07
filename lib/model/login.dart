class Login {
  final int? code;
  final String? status;
  final String? message;
  final String? token;
  final int? userId;
  final String? nama;
  final String? userEmail;

  Login({
    this.code,
    this.status,
    this.message,
    this.token,
    this.userId,
    this.nama,
    this.userEmail,
  });

  // Helper getter to check if login was successful
  bool get isSuccess => status?.toLowerCase() == 'success';

  factory Login.fromJson(Map<String, dynamic> obj) {
    // Parse userId - handle both String and int
    int? userId;
    if (obj['data']?['id'] != null) {
      final idValue = obj['data']?['id'];
      if (idValue is int) {
        userId = idValue;
      } else if (idValue is String) {
        userId = int.tryParse(idValue);
      }
    }

    return Login(
      code: obj['code'],
      status: obj['status']?.toString(),
      message: obj['message']?.toString(),
      token: obj['data']?['api_token']?.toString(),
      userId: userId,
      nama: obj['data']?['nama']?.toString(),
      userEmail: obj['data']?['email']?.toString(),
    );
  }
}
