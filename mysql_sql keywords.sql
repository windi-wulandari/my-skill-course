SELECT `restaurants`.`id`,
    `restaurants`.`restaurant_name`,
    `restaurants`.`restaurant_type_id`,
    `restaurants`.`income_persentage`,
    `restaurants`.`city_id`
FROM `penawaran`.`restaurants`;

SELECT `orders`.`id`,
    `orders`.`date`,
    `orders`.`hour`,
    `orders`.`member_id`,
    `orders`.`restaurant_id`,
    `orders`.`total_order`
FROM `penawaran`.`orders`;

-- 1. UNION, inituh menggabungkan tabel, tapi kolom atau variabelnya haruus sama, nah karena di sini aku gabungin tabel restaurant
-- dan orders berarti akan ada kolom yang NULL, dan UNION ini akan menghapus duplikat
-- Menggabungkan baris-baris dari tabel `restaurants` dan `orders`
SELECT
    `id`,
    `restaurant_name`,
    `restaurant_type_id`,
    `income_persentage`,
    `city_id`,
    NULL AS `date`,
    NULL AS `hour`,
    NULL AS `member_id`,
    NULL AS `total_order`
FROM
    `penawaran`.`restaurants`

UNION

SELECT
    `id`,
    NULL AS `restaurant_name`,
    NULL AS `restaurant_type_id`,
    NULL AS `income_persentage`,
    NULL AS `city_id`,
    `date`,
    `hour`,
    `member_id`,
    `total_order`
FROM
    `penawaran`.`orders`;


-- 2. UNION ALL, ini sama aja sih, cuma ini akan ditampilkan duplikat, gak aku buat ya, soalnya memang agak sulit untuk
-- praktik dengan database ini, kecuali hanya ingin menambahkan tabel yang sama, seperti tabel restaurant, ditambah tabel restaurant juga

-- 3. INTERSECT, ini tuh bakal menghasilkan data yang ada di kedua tabel, ini hampir sama dengan inner join
-- tapi tetap ada perbedaan ya
-- INTERSECT juga harusnya jumlah kolomnya sama, tapi karena tabel restaurants dan orders beda jadi kita ambil di
-- kolom ID aja
-- Mengambil kumpulan data yang merupakan hasil persilangan antara tabel `restaurants` dan `orders`
-- INTERSECT  gak bisa sih kalo di MySQL, paling pakai inner join
SELECT `id`
FROM `penawaran`.`restaurants`
INTERSECT
select `id`
FROM `penawaran`.`orders`;

SELECT r.id
FROM penawaran.restaurants r
INNER JOIN penawaran.orders o ON r.id = o.restaurant_id;


-- 4. EXCEPT juga gak ada di MySQL, menghasilkan data dari SELECT statement pertama yang tidak ada di SELECT 
-- statement kedua. Tapi bisa menggunakan NOT IN, atau Left Join
-- Mendapatkan data dari SELECT statement pertama yang tidak ada di SELECT statement kedua
-- Menampilkan data dari `restaurants` yang tidak ada di `orders`
SELECT r.id,
       r.restaurant_name,
       r.restaurant_type_id,
       r.income_persentage,
       r.city_id
FROM penawaran.restaurants r
LEFT JOIN penawaran.orders o ON r.id = o.restaurant_id
WHERE o.restaurant_id IS NULL;

-- Menampilkan data dari `orders` yang tidak ada di `restaurants`
SELECT o.id,
       o.date,
       o.hour,
       o.member_id,
       o.restaurant_id,
       o.total_order
FROM penawaran.orders o
LEFT JOIN penawaran.restaurants r ON o.restaurant_id = r.id
WHERE r.id IS NULL;

-- Sebetulnya ini untuk lebih familiar aja dengan query nya karena memang database kurang cocok
-- tapi sejauh ini cukup paham dalam penggunaan keywords yang di atas.