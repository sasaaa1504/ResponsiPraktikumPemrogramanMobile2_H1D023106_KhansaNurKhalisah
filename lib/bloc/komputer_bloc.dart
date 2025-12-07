import 'dart:convert';
import 'package:komp_106/model/komputer.dart';

import '../helpers/api.dart';
import '../helpers/api_url.dart';

class KomputerBloc {
  // Get all computers
  static Future<List<Komputer>> getKomputers() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api.get(apiUrl);
    var jsonObj = json.decode(response.body);

    // Check if response has data array
    if (jsonObj['data'] != null) {
      List<dynamic> listKomputer = jsonObj['data'] as List<dynamic>;
      List<Komputer> komputers = [];
      for (int i = 0; i < listKomputer.length; i++) {
        komputers.add(Komputer.fromJson(listKomputer[i]));
      }
      return komputers;
    }
    return [];
  }

  // Add new computer
  static Future<Map<String, dynamic>> addKomputer({
    required Komputer komputer,
  }) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      "nama": komputer.nama,
      "harga": komputer.harga.toString(),
      "jumlah": komputer.jumlah.toString(),
      "tanggal_masuk": komputer.tanggalMasuk,
    };

    var response = await Api.post(apiUrl, body);
    var jsonObj = json.decode(response.body);

    return {
      'success': jsonObj['status']?.toString().toLowerCase() == 'success',
      'message': jsonObj['message']?.toString() ?? 'Operation completed',
    };
  }

  // Update computer
  static Future<Map<String, dynamic>> updateKomputer({
    required Komputer komputer,
  }) async {
    String apiUrl = ApiUrl.updateProduk(komputer.id!);

    var body = {
      "nama": komputer.nama,
      "harga": komputer.harga.toString(),
      "jumlah": komputer.jumlah.toString(),
      "tanggal_masuk": komputer.tanggalMasuk,
    };

    var response = await Api.put(apiUrl, body);
    var jsonObj = json.decode(response.body);

    return {
      'success': jsonObj['status']?.toString().toLowerCase() == 'success',
      'message': jsonObj['message']?.toString() ?? 'Operation completed',
    };
  }

  // Delete computer
  static Future<Map<String, dynamic>> deleteKomputer({required int id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);

    var response = await Api.delete(apiUrl);
    var jsonObj = json.decode(response.body);

    return {
      'success': jsonObj['status']?.toString().toLowerCase() == 'success',
      'message': jsonObj['message']?.toString() ?? 'Operation completed',
    };
  }
}
