# Responsi Praktikum Mobile

Aplikasi pencatatan komputer menggunakan flutterS

---
**Nama:** Khansa Nur Khalisah <br>
**NIM:** H1D023106 <br>
**Shift:** B/E <br>

---
## Dokumentasi

![Demo Aplikasi](https://github.com/sasaaa1504/ResponsiPraktikumPemrogramanMobile2_H1D023106_KhansaNurKhalisah/blob/main/demo.gif)

### Struktur Aplikasi

1.  **Login**: Menggunakan `Api.post` ke endpoint `/auth/login`
2.  **Register**: Menggunakan `Api.post` ke endpoint `/auth/register`
3.  **List Komputer**: Menggunakan `Api.get` ke endpoint `/komputer`
4.  **Tambah Komputer**: Menggunakan `Api.post` ke endpoint `/komputer`
5.  **Edit Komputer**: Menggunakan `Api.put` ke endpoint `/komputer/{id}`
6.  **Hapus Komputer**: Menggunakan `Api.delete` ke endpoint `/komputer/{id}`

---

## Penjelasan Fungsi Utama

### 1. API Helper (`helpers/api.dart`)

- `Api.get(String url)`
Fungsi untuk melakukan HTTP GET request ke server.
- **Parameter**: `url` - URL endpoint API yang dituju
- **Return**: `Future<http.Response>` - Response dari server


- `Api.post(String url, Map<String, dynamic> data)`
Fungsi untuk mengirim data ke server menggunakan HTTP POST.
- **Parameter**: 
  - `url` - URL endpoint API
  - `data` - Data yang akan dikirim dalam bentuk Map
- **Return**: `Future<http.Response>` - Response dari server


- `Api.put(String url, Map<String, dynamic> data)`
Fungsi untuk mengupdate data ke server menggunakan HTTP PUT.
- **Parameter**:
  - `url` - URL endpoint API  
  - `data` - Data yang akan diupdate
- **Return**: `Future<http.Response>` - Response dari server
- **Kegunaan**: Digunakan untuk mengupdate data komputer

- `Api.delete(String url)`
Fungsi untuk menghapus data dari server menggunakan HTTP DELETE.
- **Parameter**: `url` - URL endpoint API
- **Return**: `Future<http.Response>` - Response dari server
- **Kegunaan**: Digunakan untuk menghapus data komputer

- `Api.parseResponse(http.Response response)`
Fungsi untuk mem-parse response dari API.
- **Parameter**: `response` - HTTP Response object
- **Return**: `Map<String, dynamic>` - Data JSON hasil parsing
- **Fitur**:
  - Validasi status code (200-299 dianggap sukses)
  - Throw exception jika terjadi error

---

### 2. User Info Helper (`helpers/user_info.dart`)

- `UserInfo.saveSession({...})`
Menyimpan informasi session pengguna setelah login berhasil.
- **Parameter**:
  - `token` - Token autentikasi dari API
  - `userId` - ID pengguna
  - `userName` - Nama pengguna
  - `userEmail` - Email pengguna
- **Storage**: Menggunakan SharedPreferences

- `UserInfo.getToken()`
Mengambil token autentikasi dari storage.
- **Return**: `Future<String?>` - Token atau null jika tidak ada

- `UserInfo.isLoggedIn()`
Mengecek apakah user sudah login atau belum.
- **Return**: `Future<bool>` - true jika sudah login, false jika belum

- `UserInfo.clearSession()`
Menghapus semua data session (logout).
- **Kegunaan**: Dipanggil saat user logout dari aplikasi

---

### 3. Login BLoC (`bloc/login_bloc.dart`)

- `LoginBloc.login({required String email, required String password})`
Menangani proses login pengguna.
- **Parameter**:
  - `email` - Email pengguna
  - `password` - Password pengguna
- **Return**: `Future<Login>` - Object Login berisi status dan data user

---

### 4. Registrasi BLoC (`bloc/registrasi_bloc.dart`)

- `RegistrasiBloc.registrasi({required String nama, required String email, required String password})`
Menangani proses registrasi pengguna baru.
- **Parameter**:
  - `nama` - Nama lengkap pengguna
  - `email` - Email pengguna
  - `password` - Password pengguna
- **Return**: `Future<Registrasi>` - Object Registrasi berisi status pendaftaran


---

### 5. Komputer BLoC (`bloc/komputer_bloc.dart`)

- `KomputerBloc.getKomputers()` Mengambil semua data komputer dari server.
- **Return**: `Future<List<Komputer>>` - List berisi semua data komputer

- `KomputerBloc.addKomputer({required Komputer produk})` Menambahkan data komputer baru.
- **Parameter**: `produk` - Object Komputer yang akan ditambahkan
- **Return**: `Future<Map<String, dynamic>>` - Map berisi status success dan message

- `KomputerBloc.updateKomputer({required Komputer produk})`
Mengupdate data komputer yang sudah ada.
- **Parameter**: `produk` - Object Komputer dengan data terbaru (harus ada ID)
- **Return**: `Future<Map<String, dynamic>>` - Map berisi status success dan message

- `KomputerBloc.deleteKomputer({required int id})`
Menghapus data komputer berdasarkan ID.
- **Parameter**: `id` - ID komputer yang akan dihapus
- **Return**: `Future<Map<String, dynamic>>` - Map berisi status success dan message

---

### 6. Komputer Page (`ui/komputer_page.dart`)
- `_fetchComputers()` Mengambil data komputer dari server dan menampilkannya.
- `_filterComputers(String query)` Memfilter data komputer berdasarkan query pencarian.
- `_deleteComputer(int id)` Menghapus data komputer dengan konfirmasi.
- `_logout()` Menangani proses logout dengan konfirmasi.

---

### 7. Komputer Form (`ui/komputer_form.dart`)

- `_selectDate()` Menampilkan date picker untuk memilih tanggal masuk komputer.
- `_saveComputer()`  Menyimpan atau mengupdate data komputer.
