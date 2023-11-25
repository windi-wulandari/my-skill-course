create database UNIVERSITAS;


create table DOSEN (
	ID_DOSEN varchar (50) primary key,
	NAMA_DOSEN varchar (100),
	PROGRAM_STUDI varchar (50)
);


describe DOSEN;

drop table DOSEN;

create table MAHASISWA (
	ID_MAHASISWA varchar (50),
    NAMA_MAHASISWA varchar (100),
    PROGRAM_STUDI varchar (50),
    ID_DOSEN_WALI varchar (50),
	FOREIGN KEY (ID_DOSEN_WALI) REFERENCES DOSEN(ID_DOSEN)
   );
  
  
describe MAHASISWA;


insert into UNIVERSITAS.DOSEN (ID_DOSEN, NAMA_DOSEN, PROGRAM_STUDI)
values
	('AI', 'Windi', 'Administrasi Publik'),
    ('A2', 'Wulan', 'Administrasi Negara'),
    ('A3', 'Dari', 'Teknologi Informatika'),
    ('A4', 'Suherlan', 'Ekonomi');
    
select * from DOSEN;


-- ALTER TABLE
-- 1. Menambahkan Tabel
	alter table DOSEN add GOLONGAN_DARAH varchar (3);
    
-- 2. Menghapus kolom pada tabel
	alter table DOSEN drop column GOLONGAN_DARAH;

-- 3. Mengubah nama kolom pada tabel
	alter table DOSEN change column ID_DOSEN NOMOR_INDUK_DOSEN varchar (50);
    
-- 4. Mengubah tipe data dalam tabel
	alter table DOSEN modify column NAMA_DOSEN varchar (200);
    describe DOSEN;