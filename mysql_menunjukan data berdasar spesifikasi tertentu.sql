create database  UMKM;

-- 1. CEK KEBERADAAN TABLE 
	select * from UMKM_JABAR;
    
-- 2. Tunjukan data UMKM di Kota Bandung
	select * from umkm_jabar where nama_kabupaten_kota = "kota bandung";
    
-- 3. Tunjukan data umkm dari tahun 2019 dan disusun berdasarkan kategori_usaha 
	select * from umkm_jabar where tahun >= 2019 order by kategori_usaha, tahun;
    
-- 4. soal no. 3 namun dibatasi jumlah rownya s.d 10
	select * from umkm_jabar where tahun >= 2019 order by kategori_usaha, tahun limit 10;
    
-- 5. kategori_usaha apa aja yang tersedia dalam dataset
	select distinct kategori_usaha from umkm_jabar ;
    
-- 6. Tunjukan seluruh data hanya kategori_usaha FASHION dan MAKANAN
	select * from UMKM_JABAR WHERE kategori_usaha in ("FASHION", "MAKANAN");
	select * from UMKM_JABAR WHERE kategori_usaha = "FASHION" OR KATEGORI_USAHA = "MAKANAN";
    
-- 7. Tunjukan seluruh data dengan kategori usaha FASHION di Kabupaten Karawang
	select * from umkm_jabar where kategori_usaha = "fashion" and nama_kabupaten_kota = "kabupaten karawang";
    
-- 8. tunjukan seluruh data selain kategori_usaha kuliner, makanan, dan minuman
	select * from umkm_jabar where kategori_usaha not in ("kuliner", "makanan", "minuman");
    
-- 9. dari tahun 2018 s.d 2020, bagaimana trend jumlah umkm di kabupaten tasikmalaya untuk kategori usaha batik?
	select nama_kabupaten_kota, kategori_usaha, jumlah_umkm, satuan, tahun from umkm_jabar where tahun <= 2020  
    and tahun >= 2018  and nama_kabupaten_kota = "kabupaten tasikmalaya"  and kategori_usaha = "batik";
    
-- 10. di antara kota bandung, kabupaten bandung dan kabupaten bandung barat, 
-- 	   di manakah umkm kuliner terpusat pada tahun 2021
	select * from umkm_JABAR WHERE nama_kabupaten_kota LIKE "%BANDUNG%" AND kategori_usaha = "KULINER" 
    AND TAHUN = 2021;
    
-- 11. Kabupaten/kota mana saja yang memiliki angka 7 pada digit ke 3 kode tersebut
	select distinct kode_kabupaten_kota, nama_kabupaten_kota from umkm_JABAR where kode_kabupaten_kota like "__7%";
	
	