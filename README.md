# 🗂️ Rakamin Project Based-Internship: Kimia Farma - Performance Analytics (2020-2023)
Sebagai seorang Big Data Analytics Intern di Kimia Farma, tugas 
Anda akan mencakup serangkaian tantangan yang memerlukan 
pemahaman mendalam tentang data dan kemampuan analisis. Salah 
satu proyek utama Anda adalah mengevaluasi kinerja bisnis Kimia 
Farma dari tahun 2020 hingga 2023. Berikut ini adalah task yang 
harus anda lakukan:

## **1. Import Dataset ke BigQuery 🔼**
Pada proyek ini buatlah sebuah dataset di BigQuery Google Cloud Platform dan tambahkan 4 tabel : `kf_final_transaction.csv` [(link)](https://drive.google.com/file/d/1iDOBdKZ4-kkLhpklQWWrsFvACtI7MCz3/view), `kf_inventory.csv` [(link)](https://drive.google.com/file/d/1ihtG2t0V1AO0IAGkGwQaqtba6AxDEKDI/view), `kf_kantor_cabang.csv` [(link)](https://drive.google.com/file/d/1vzaasqIeXqqe_jI99dNLaa8nxnoe9OWW/view), `kf_product.csv` [(link)](https://drive.google.com/file/d/1739wO7BwtVStHCA4Dcj9xGhlc_blBNbT/view).

![alt text](https://images2.imgbox.com/17/18/4VlnXwoA_o.png)


## **2. Membuat Tabel Analisa 📋 [(Query)](https://github.com/verrenangelinasaputra/Rakamin-Project-Based-Internship---Kimia-Farma-Performance-Analytics/blob/main/RakaminKFAnalytics.sql)** 
### **a. Tabel Hasil Agregat 4 Tabel**
Berikut adalah hasil tabel yang sudah berhasil terbuat dari agregasi keempat tabel yang telah diimport dalam dataset “kimia_farma”, telah mencakup ragam kolom yang diwajibkan.
``` sql
SELECT * FROM kimia_farma.kimia_farma_analytics
```
![alt text](https://images2.imgbox.com/f7/a6/ZtFyAlZb_o.png)
### **b. Tabel Distribusi Harga Produk Kimia Farma**
Selain itu, kita juga bisa menganalisa hal lainnya seperti distribusi harga dan volume transaksi untuk berbagai produk, dengan menyajikan jumlah total transaksi, harga maksimum, minimum, dan rata-rata untuk masing-masing produk dari setiap cabang Kimia Farma.
![alt text](https://images2.imgbox.com/bb/58/bhsQ3npN_o.png)
### **c. Tabel Performance Cabang Kimia Farma**
Kita juga dapat menyajikan sebuah hasil analisa terkait kinerja cabang di setiap kota dan provinsi dengan melihat total transaksi yang dilakukan di sepanjang 2020-2023 dan akumulasi rating dari setiap transaksi yang dilakukan. Lalu kita dapat mengurutkannya berdasarkan rating tertinggi.

![alt text](https://images2.imgbox.com/63/17/OPXhF4pE_o.png)
### **d. Tabel Volume Transaksi Cabang Kimia Farma**
Berdasarkan raw data yang kita miliki, kita dapat melakukan analisa terhadap cabang Kimia Farma di setiap kota dan provinsi, untuk melihat top 100 cabang mana sajakah yang paling aktif dengan volume transaksi tertinggi selama tahun 2020-2023. Hal ini dapat membantu Kimia Farma dalam alokasi sumber daya, penentuan strategi pemasaran dan promosi, serta evaluasi optimalisasi operasional.
![alt text](https://images2.imgbox.com/f0/8a/olyneTCQ_o.png)


## **3. Membuat Dashboard Performance Analytics Kimia Farma 2020-2023 📊**
Pada proyek ini, telah dibuat sebuah dashboard analisis kinerja Kimia Farma tahun 2020-2023 di Google Looker Studio. Dashboard ini anda buat berdasarkan tabel analisa yang telah anda buat sebelumnya pada BigQuery, sehingga perlu menghubungkan table tersebut ke Google Looker Studio. Adapun data yang dianalisis mencakup:
- Perbandingan Pendapatan Kimia Farma dari tahun ke tahun.
- Top 10 total transaksi cabang provinsi.
- Top 10 nett sales cabang provinsi.
- Top 5 cabang dengan rating tertinggi, namun memiliki rating transaksi terendah.
- Indonesia's geo map untuk total profit masing-masing provinsi.
- Distribusi penjualan jenis produk Kimia Farma.

🔗 Akses dashboard interaktif pada link berikut : [Google Looker Studio](https://lookerstudio.google.com/reporting/b6e42743-c1ab-4e00-b873-44370a2ef814) 

![alt text](https://images2.imgbox.com/f7/d9/XbV8in8U_o.png)



