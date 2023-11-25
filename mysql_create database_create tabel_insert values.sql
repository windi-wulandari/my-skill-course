create database SDM;

CREATE TABLE SDM.Karyawan (
	NIK varchar (16),
    NAMA_KARYAWAN varchar (200),
    LEVEL_JABATAN integer,
    TANGGAL_LAHIR date);
    
	
insert into SDM.KARYAWAN values (
	"A01",
    "Windi",
    1,
    "2001-03-04");
    

select * from SDM.KARYAWAN;
    
    
insert into KARYAWAN (NIK, NAMA_KARYAWAN, LEVEL_JABATAN, TANGGAL_LAHIR) 
values (
	"A03",
    "Limerence",
    5,
    "1100-03-04" );
    

    

    