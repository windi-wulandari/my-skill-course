-- Membuat database
CREATE DATABASE mahasiswa;


-- Membuat tabel mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    birth_time TIME,
    instagram_username VARCHAR(50)
);

-- Mengisi data ke tabel mahasiswa
INSERT INTO mahasiswa (id, first_name, last_name, birth_date, birth_time, instagram_username)
VALUES
    (1, 'John', 'Doe', '1995-03-15', '12:30:00', 'john_doe'),
    (2, 'Jane', 'Smith', '1998-08-22', '15:45:00', 'jane_smith'),
    (3, 'Michael', 'Johnson', '1990-05-10', '09:15:00', 'michael_j'),
    (4, 'Emily', 'Williams', '1993-11-28', '18:20:00', 'emily_w'),
    (5, 'Daniel', 'Brown', '1997-02-07', '14:00:00', 'daniel_b');
    
select * from mahasiswa

-- Ini salah sih syntax katanya tapi gak bisa dihapus, jadi yaudah biarin aja
SELECT *, CONCAT_WS(' ', first_name, last_name) AS full_name FROM mahasiswa;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-- FUNGSI STRING

-- 1. Fungsi concat untuk penggabungan string
select *, concat(first_name, ' ', last_name) as full_name from mahasiswa;

-- 2. Fungsi concat_ws, ini sama juga dengan concat di atas, hanya saja lebih fleksibel, bisa nambahin lain-lain
select *, concat_ws(' ', first_name, last_name) as full_name from mahasiswa;
select *, concat_ws('/', 'www.instagram.com', instagram_username) as url_instagram from mahasiswa;

-- 3. substring, digunakan untuk mengambil beberapa karakter dari string, aku langsung aja tambahin fungsi yang concat_ws
select *, substring(concat_ws('/', 'www.instagram.com', instagram_username), 19, 20) as instagram from mahasiswa;

-- 4. repeat, merupakan fungsi yang berguna untuk menduplikat suatu string sesuai jumlah yang ditentukan

-- 5. REVERSE () merupakan fungsi yang berguna untuk membalikkan string, dibalik gitu katanya
SELECT *, REVERSE(first_name) AS first_name_reversed FROM mahasiswa;
SELECT *, IFNULL(REVERSE(first_name), '') AS first_name_reversed FROM mahasiswa;

-- 6. Fungsi upper dan lower, huruf besar dan kecil
SELECT *,
    UPPER(first_name) AS upper_first_name,
    LOWER(first_name) AS lower_first_name
FROM mahasiswa;

-- 7 trims, bisa digunakan untuk memebersikan string kosong, misal kalau ada spasi di depan

-- 8. lpad dan rpad, buat nambahin sting ke kiri atau kanan
select *, lpad(first_name, 10, last_name) as lpad from mahasiswa;
select *, rpad(first_name, 10, last_name) as rpad from mahasiswa;

-- 9. replace, nah inituh untuk ngubah string ya, gak aku contohin

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

-- FUNGSI DATE

-- Mengambil tanggal dari datetime
SELECT *, DATE(birth_date) AS result_date from mahasiswa;

-- Mengambil bulan dari datetime
SELECT *, MONTH(birth_date) AS result_month from mahasiswa;


-- Mengambil tahun dari datetime
SELECT *, YEAR(birth_date) AS result_year from mahasiswa;


-- Mengabungkan tanggal dan waktu
SELECT *, TIMESTAMP(birth_date, birth_time) AS result_timestamp from mahasiswa;


-- Menghitung jarak waktu antar tanggal/timestamp
SELECT *, DATEDIFF('1995-03-15 12:30:00', '1997-02-07') AS result_datediff from mahasiswa;


-- Menambahkan date atau datetime dengan interval yang ditentukan, btw itu data ngasal ya, sulit kalo pake tabel mahasiswa
SELECT DATE_ADD('2022-09-15 01:41:21', INTERVAL 1 DAY) AS result_date_add;


-- Mengurangi date atau datetime dengan interval yang ditentukan, ini juga ngasal datanya, untuk percobaan saja
SELECT DATE_SUB('2022-09-15 01:41:21', INTERVAL 1 HOUR) AS result_date_sub;


--------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ini ada soal ya dalam sesi course ini, tapi tidak berhubungan dengan fungsi di atas

-- 1. Customer ID yang Paling Lama Menjadi Customer (Berdasarkan Dt_Customer)
SELECT 
    `ID`,
    `Dt_Customer`
FROM 
    `konsumen`.`customer`
ORDER BY 
    `Dt_Customer` ASC
LIMIT 1;

-- 2. Customer ID yang Berusia Paling Tua (Berdasarkan Year_Birth):
SELECT 
    `ID`, `Year_Birth`
FROM
    `konsumen`.`customer`
ORDER BY `Year_Birth` ASC
LIMIT 1;






