-- Verren Angelina Saputra

-- A) Penjelasan:
-- 1. Lakukan SELECT pada seluruh mandatory columns dalam keempat 4 tabel yang sudah diimport di dataset kimia_farma.
-- 2. Gunakan SELECT CASE untuk menentukan persentase_gross_laba.
-- 3. Masukkan formula umum untuk menghitung diskon yaitu (actual_price - (actual_price * discount)) untuk nett_sales.
-- 4. nett_profit didapat dari net_sales * persentase_gross_laba, sehingga kita membutuhkan SELECT CASE lagi untuk mendapatkan persentase dari laba tersebut.
-- 5. Lakukan JOIN untuk 4 tabel supaya saling terkoneksi

SELECT 
  ft.transaction_id,
  ft.date,
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating as `rating_cabang`,
  ft.customer_name, 
  p.product_id,
  p.product_category,
  p.price as `actual_price`,
  ft.discount_percentage,
  CASE
    WHEN ft.price <= 50.000 THEN 0.10
    WHEN ft.price > 50.000 AND ft.price <= 100.000 THEN 0.15
    WHEN ft.price > 100.000 AND ft.price <= 300.000 THEN 0.20
    WHEN ft.price > 300.000 AND ft.price <= 500.000 THEN 0.25
    WHEN ft.price > 500.000 THEN 0.30
  END as `persentase_gross_laba`, -- Persentase laba yang seharusnya diterima dari obat
  (p.price - (p.price * ft.discount_percentage / 100)) as `nett_sales`, -- harga setelah diskon
  (p.price - (p.price * ft.discount_percentage / 100)) *
  CASE 
    WHEN ft.price <= 50.000 THEN 0.10
    WHEN ft.price > 50.000 AND ft.price <= 100.000 THEN 0.15
    WHEN ft.price > 100.000 AND ft.price <= 300.000 THEN 0.20
    WHEN ft.price > 300.000 AND ft.price <= 500.000 THEN 0.25
    WHEN ft.price > 500.000 THEN 0.30
  END as `nett_profit`, -- keuntungan yang diperoleh Kimia Farma
  ft.rating as `rating_transaksi`
FROM kimia_farma.kf_final_transaction as ft
JOIN kimia_farma.kf_kantor_cabang kc ON ft.branch_id = kc.branch_id
JOIN kimia_farma.kf_product p ON ft.product_id = p.product_id;


-- B) Penjelasan:
-- 1. Kita ingin menganalisa total transaksi, max price, min price, dan average price untuk masing-masing product yang berhasil terjual di kimia farma
-- 2. Gunakan COUNT, MAX, MIN, AVG untuk mendapatkan nilai yang dibutuhkan
-- 3. Gunakan GROUP BY untuk mengelompokkan hasil harga berdasarkan produknya

SELECT 
  p.product_id,
  COUNT(ft.transaction_id) AS `Total of Transactions`,
  MAX(p.price) AS `Maximum Price`,
  MIN(p.price) AS `Minimum Price`,
  AVG(p.price) AS `Average Price`,
FROM kimia_farma.kf_product p
JOIN kimia_farma.kf_final_transaction ft ON p.product_id = ft.product_id
GROUP BY p.product_id;


-- C) Penjelasan:
-- 1. Kita ingin menganalisa rata-rata rating dari setiap cabang di seluruh kota dan provinsi.
-- 2. Kita menggunakan AVG untuk akumulasi rata-rata rating yang didapatkan dari setiap transaksi di cabang tersebut.
-- 3. Gunakan COUNT untuk menghitung total transaksi.
-- 4. Gunakan GROUP BY untuk mengelompokkan data berdasarkan branch_id, branch_name, kota, dan provinsi.
-- 5. Gunakan ORDER BY untuk mengurutkan data secara DESCENDING berdasarkan rata-rata rating.

SELECT 
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  AVG(ft.rating) AS average_rating,
  COUNT(ft.transaction_id) AS total_transactions
FROM kimia_farma.kf_final_transaction ft
JOIN kimia_farma.kf_kantor_cabang kc ON ft.branch_id = kc.branch_id
GROUP BY kc.branch_id, kc.branch_name, kc.kota, kc.provinsi
ORDER BY average_rating DESC;


-- D) Penjelasan:
-- 1. Kita ingin melihat 100 kota terbaik yang melakukan transaksi jual-beli obat terbanyak.
-- 2. Gunakan LIMIT untuk membatasi hasil.
-- 3. Gunkanan COUNT untuk menghitung total transaksi.
-- 4. Gunakan ORDER BY untuk mengurutkan data secara DESCENDING berdasarkan total_transaction.

SELECT 
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  COUNT(ft.transaction_id) as total_transaction
FROM kimia_farma.kf_kantor_cabang kc
JOIN kimia_farma.kf_final_transaction ft ON kc.branch_id = ft.branch_id
GROUP BY kc.branch_id, kc.branch_name, kc.kota, kc.provinsi
ORDER BY total_transaction DESC
LIMIT 100;