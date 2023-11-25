select * from umkm_jabar;

-- 1. berapa jumlah baris dari UMKM JABAR
	select count(*) as jumlah_baris from umkm_jabar;
    
-- 2. berapa jumlah umkm di kabupaten bekasi pada tahun 2017
	select sum(Jumlah_umkm) as jumlah_umkm_kab_bekasi_thn_2017  from umkm_jabar 
    where nama_kabupaten_kota = "kabupaten bekasi" and tahun = 2017;
    
-- 3. bagaimana tren jumlah umkm di kabupaten karawang dari tahun 2017 s.d 2021
	select tahun, sum(jumlah_umkm) as jumlah_umkm_kab_karawang from umkm_jabar where nama_kabupaten_kota = "kabupaten karawang" 
    and tahun >= 2017 and tahun <= 2021 group by tahun;
    
-- 4. berapa jumlah rata-rata umkm setiap kategori usaha per kabupaten/kota di jawa barat pada tahun 2021
	select tahun, kategori_usaha, sum(jumlah_umkm) from umkm_jabar where tahun = 2021 group by tahun, kategori_usaha order by kategori_usaha;
    
-- 5 nilai minimum dan maksimum dari kolom jumlah umkm
	select min(jumlah_umkm) as jumlah_umkm_min, max(jumlah_umkm) as jumlah_umkm_max from umkm_jabar;
    
-- 6. kabupaten atau kota apa yang memiliki jumlah umkm kurang dari 100.000 pada tahun 2020
	select nama_kabupaten_kota, sum(jumlah_umkm) as nama_kabupaten_kota_2021 from umkm_jabar 
    where tahun =2020 group by nama_kabupaten_kota having nama_kabupaten_kota_2021 < 100000;
    
