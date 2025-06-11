# TUGAS ARSITEKTUR SISTEM KOMPUTER ASSEMBLY

## Instalasi dan setup
Pertama install DOSBox [disini](https://www.dosbox.com/download.php?main=1).

Kemudian (Optional but highly recommended) tambahkan DOSBox ke PATH environment variable agar bisa diakses dari terminal.
1. Klik tombol windows dan cari "Edit the system environment variables".
2. Klik "Environment Variables" di bagian bawah.
3. Di bagian "System variables", cari variabel bernama `Path` dan klik "Edit".
4. Klik "New" dan tambahkan path ke direktori DOSBox, misalnya `C:\Program Files(x86)\DOSBox-0.74-3`.
5. Klik "OK" untuk menyimpan perubahan.
6. Restart VSCode atau terminal yang sedang digunakan.

Kemudian lakukan setup DOSBox agar automatis melakukan mount ke repositori ini (di folder compiler sudah ada program program dosbox yang dibutuhkan)
1. Buka file `dosbox.conf` yang ada di folder `compiler`.
3. Cari bagian `[autoexec]` di akhir file.
4. Tambahkan baris berikut di bawahnya:
   ```
   mount c C:\path\to\your\repository
   c:
   set PATH=%PATH%;C:\compiler;C:\compiler\DEBUGX
   ```
   Gantilah `C:\path\to\your\repository` dengan path ke direktori repositori ini.
5. (Optional) Ubah variabel `fullresolution` dan `windowresolution` untuk menyesuaikan ukuran jendela DOSBox sesuai selera. Misalnya:
   ```
   fullresolution=original
   windowresolution=1024x768
   ```
   Ini akan membuat jendela DOSBox berukuran 1024x768 piksel.
6. Simpan perubahan pada file `dosbox.conf`.

## Melakukan Praktikum
Silahkan melakukan perubahan pada file `.asm` jika dirasa ada yang perlu diubah. Setelah itu, buka terminal dan jalankan perintah berikut untuk melakukan kompilasi:
```bash
Dosbox -noconsole -conf .\dosbox.conf
```

Akan tampil jendela DOSBox. Setelah itu, jalankan perintah berikut untuk melakukan kompilasi:
```bash
TASM nama_file.asm
TLINK nama_file.obj
```
Untuk menjalankan program, tinggal tuliskan nama executable yang dihasilkan, misalnya:
```bash
nama_file.exe
```
## Debugging
Untuk keperluan laporan, gunakan debug untuk melihat hasil eksekusi program. Untuk menjalankan debug, jalankan perintah berikut di jendela DOSBox:
```bash
DEBUG nama_file.exe
```
Silahkan merujuk ke [dokumentasi MS-DOS DEBUG](https://thestarman.pcministry.com/asm/debug/debug2.htm#CMDS) untuk mengetahui perintah-perintah yang tersedia. Selamat mengerjakan Laporan Praktikum!

-Palel