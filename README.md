# TUGAS ARSITEKTUR SISTEM KOMPUTER ASSEMBLY

## Instalasi dan setup
Pertama install DOSBox [disini](https://www.dosbox.com/download.php?main=1).

Setelah install, clone repositori ini
```bash
git clone https://github.com/Kak-Palel/Arsikom_Penjumlahan_matriks.git
```


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

## Penjelasan Program
di file [JUMLAH.asm](JUMLAH.asm), terdapat program untuk menjumlahkan dua matriks 1 dimensi yang isi matriks dan juga n (panjang matriks) nya ditetapkan secara hardcode di segment data di line 2 - 7.
```asm
.data
    n db 20                                                         ; Number of elements to add
    A db 0, 1, 1, 2, 3, 3, 4, 4, 5, 1, 1, 2, 2, 2, 3, 3, 4, 4, 0, 1 ; Matrix A
    B db 1, 1, 2, 2, 2, 3, 3, 4, 4, 0, 1, 1, 2, 3, 3, 4, 4, 5, 1, 1 ; Matrix B
    C db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; Matrix C to store the result
    newline db 13, 10, '$'                                          ; Newline characters for printing

```
Sehingga untuk mengubah isi isi matriks, Anda bisa mengubah isi dari variabel `A`, `B`, dan `C` di atas. Untuk mengubah panjang matriks, jangan lupa untuk mengubah nilai dari variabel `n`.

apabila hasil penjumlahan merupakan bilangan yang lebih dari 1 digit, maka program ini akan menampilkan hasil penjumlahan tersebut dalam bentuk ASCII diatas 9. Misalnya, jika hasil penjumlahan adalah `10`, maka program akan menampilkan karakter `:`. jika hasil penjumlahan adalah `-1`, maka program akan menampilkan karakter `\`

pada file [JUMLAH-CALL.asm](JUMLAH-CALL.asm), terdapat program yang sama dengan [JUMLAH.asm](JUMLAH.asm) namun dengan penggunaan sub routine dan juga user input. input pertama adalah 2 digit yang merepresentasikan n, kemudian input kedua dan ketiga adalah isi dari matriks A dan B. Format input tidak boleh ada spasi, untuk bilangan n 1 digit, wajib berikan angka 0 didepannya. dan jangan klik enter setelah selesai memasukkan salah satu input (misal setelah selesai memasukkan input n), program akan berpindah ke new line dengan automatis. berikut contoh input dan output program:

```bash
C:\>JUMLAH~1
04
1111
1231
2342
```

## Beberapa catatan
- DOSBox menyingkat nama file yang panjangnya lebih dari 5 karakter menjadi 6 karakter dengan format `nama~1`. Misal, nama file `JUMLAH-CALL.asm` menjadi `JUMLAH~1`. Jadi pastikan untuk menggunakan nama file yang pendek atau sesuai dengan format tersebut saat menjalankan program. Atau cek nama file dengan perintah `dir` di jendela DOSBox
- Ketika kita mengklik enter di keyboard kita untuk berpindah ke line bawah di terminal, klik tersebut terhitung sebagai input yang masuk ke register dx juga dan dibaca oleh program yang mengira itu adalah value ascii yang perlu dijadikan angka, hal ini bisa mengakibatkan prompt input yang terlihat seperti lebih sedikit dari seharusnya dan output yang berisikan karakter karakter aneh.

## Debugging
Untuk keperluan laporan, gunakan debug untuk melihat hasil eksekusi program. Untuk menjalankan debug, jalankan perintah berikut di jendela DOSBox:
```bash
DEBUG nama_file.exe
```
Silahkan merujuk ke [dokumentasi MS-DOS DEBUG](https://thestarman.pcministry.com/asm/debug/debug2.htm#CMDS) untuk mengetahui perintah-perintah yang tersedia. Selamat mengerjakan Laporan Praktikum!

-Palel
