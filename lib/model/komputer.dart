class Komputer {
  final int? id;
  final String nama;
  final int harga;
  final int jumlah;
  final String tanggalMasuk;
  final String? createdAt;
  final String? updatedAt;

  Komputer({
    this.id,
    required this.nama,
    required this.harga,
    required this.jumlah,
    required this.tanggalMasuk,
    this.createdAt,
    this.updatedAt,
  });

  // Create Komputer from JSON
  factory Komputer.fromJson(Map<String, dynamic> json) {
    // Helper function to convert to int
    int parseToInt(dynamic value, {int defaultValue = 0}) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    return Komputer(
      id: json['id'] != null ? parseToInt(json['id']) : null,
      nama: json['nama']?.toString() ?? '',
      harga: parseToInt(json['harga']),
      jumlah: parseToInt(json['jumlah']),
      tanggalMasuk: json['tanggal_masuk']?.toString() ?? '',
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  // Convert Komputer to JSON (for create/update)
  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'harga': harga,
      'jumlah': jumlah,
      'tanggal_masuk': tanggalMasuk,
    };
  }

  // Create a copy with updated fields
  Komputer copyWith({
    int? id,
    String? nama,
    int? harga,
    int? jumlah,
    String? tanggalMasuk,
    String? createdAt,
    String? updatedAt,
  }) {
    return Komputer(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      jumlah: jumlah ?? this.jumlah,
      tanggalMasuk: tanggalMasuk ?? this.tanggalMasuk,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
