class Registrasi {
  final int? code;
  final String? status;
  final String? message;
  final Map<String, dynamic>? data;

  Registrasi({this.code, this.status, this.message, this.data});

  // Helper getter to check if registration was successful
  bool get isSuccess => status?.toLowerCase() == 'success';

  factory Registrasi.fromJson(Map<String, dynamic> obj) {
    return Registrasi(
      code: obj['code'],
      status: obj['status']?.toString(),
      message: obj['message']?.toString(),
      data: obj['data'] as Map<String, dynamic>?,
    );
  }
}
