--create-- TABLO OLURSTURMA
create table ogrenciler 
(
id char(4),
isim_soyisim varchar(30),
not_ortalamasi real,
kayit_tarihi date

);

--VAR OLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA

CREATE TABLE ogrenci_ortalama
AS
SELECT isim_soyisim,not_ortalamasi
FROM ogrenciler;


--SELECT -- DQL

select * from ogrenciler -- * BIR TABLADOKI BUTUN VERILERI CAGIRMAK ICIN KULLANDIK
select * from ogrenci_ortalama
select isim_soyisim,kayit_tarihi from ogrenciler




