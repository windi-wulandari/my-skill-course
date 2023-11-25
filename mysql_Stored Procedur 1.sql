select * from umkm_jabar;

-- 1. Membuat Stored Prosedured Sederhana
DELIMITER $$
create procedure geAllData ()
BEGIN
	select * from umkm_jabar;
END $$
DELIMITER ;


-- 2. Memanggil Stored Procedured
CALL geAllData();


-- 3. Mengecek stored procedured
SHOW PROCEDURE STATUS;


-- 4. Menghapus Stored Procedur
DROP PROCEDURE geAllData;


-- 5. Membuat Store Procedur dengan Parameter
-- 5.1 Parameter IN
DELIMITER //
Create Procedure getDataUMKM
(
	IN nama_kab varchar (100)
)
BEGIN
	Select * from umkm_jabar where nama_kabupaten_kota = nama_kab;
END//
DELIMITER ;

CALL getDataUMKM("Kabupaten Karawang");


-- 5.2 Parameter OUT
-- variabel digunakan untuk menyimpan/menampung nilai yang diberikan oleh stored procedur
DELIMITER $$
Create Procedure getTotalRow 
(
	OUT jumlah_row int
) 
BEGIN
	SELECT COUNT(*) INTO jumlah_row FROM umkm_jabar;
END $$
DELIMITER ;

CALL getTotalRow(@jumlah_row);
select @jumlah_row;


-- 5.3 Parameter INOUT
DELIMITER $$
Create Procedure getTotalRow2
(
	INOUT kode_kab int
) 
BEGIN
	SELECT COUNT(*) INTO kode_kab FROM umkm_jabar where kode_kabupaten_kota = kode_kab;
END $$
DELIMITER ;

SET @kode_kab_kota = 3201;
CALL getTotalRow2 (@kode_kab_kota);
select @kode_kab_kota;
SELECT COUNT(*) FROM umkm_jabar where kode_kabupaten_kota = 3201;


-- 6. Loop
create table id_mahasiswa (id int);

select * from id_mahasiswa;
insert into id_mahasiswa values (1);

DELIMITER $$
CREATE PROCEDURE buatIDMahasiswa()
BEGIN
    DECLARE Counter INT DEFAULT 2;
    WHILE Counter <= 10 DO
        INSERT INTO umkm.id_mahasiswa (id) VALUES (Counter);
        SET Counter = Counter + 1;
    END WHILE;
END$$
DELIMITER ;

CALL buatIDMahasiswa();
select * from id_mahasiswa;


-- 7. Conditional Statement (IF THEN)
DELIMITER $$
CREATE PROCEDURE Test
(
	IN bilangan INT,
    OUT hasil VARCHAR (100)
)
BEGIN
	IF bilangan > 50 THEN SET hasil = "lebih dari 50";
    ELSE SET hasil = "kurang dari sama dengan 50";
    END IF;
END$$
DELIMITER ;

CALL Test(1, @hasil_test);
SELECT @hasil_test;


