create table bodybuilders 
(
isim char (5),
win_title_no int,
age int,
date_o_birth date
);

select * from bodybuilders

insert into bodybuilders values ('cbum', 3, 28, '02.06.1994')
insert into bodybuilders values ('yates', 6, 60, '01.01.1962')


create table tedarikciler
(
tedarikci_id char (10),
tedarikci_ismi varchar (30),
tedarikci_adres varchar (50),
ulasim_tarihi date
)

create table tedarikci_ziyaret
as select tedarikci_ismi, ulasim_tarihi
from tedarikciler

select * from tedarikciler
select * from tedarikci_ziyaret

create table ogrenciler2
(
id char (4) unique,
isim varchar (50) not null,
not_ortalamasi real,
adres varchar (100),
kayit_tarihi date
);

select * from ogrenciler2


create table tedarikciler7
(
tedarikci_id char(10) primary key,
tedarikci_ismi varchar (30),
iletisim_isim varchar (30)
);

create table urunler7
(
tedarikci_id char (10),
urun_id char (10),
constraint urunler_fk foreign key (tedarikci_id)
references tedarikciler7 (tedarikci_id)
)


CREATE TABLE ogrenciler7
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler7 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler7 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler7 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler7 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Ali', 99);


select * from ogrenciler7
delete from ogrenciler7 where isim = 'Kemal Yasa' or isim = 'Nesibe Yilmaz'

truncate table ogrenciler7

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);


INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini vemaaşlarini listeleyin.



marka ismi, calisan ismi, maas

select isim,maas from calisanlar2
where isyeri in (select marka_isim from markalar where calisan_sayisi > 15000)


-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim, maas, sehir from calisanlar2
where isyeri in(select marka_isim from markalar where marka_id > 101)


-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


select marka_id,calisan_sayisi from markalar
where marka_isim in(select isyeri from calisanlar2 where sehir ='Ankara');

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.


select marka_id, marka_isim,
(select count(sehir) from calisanlar2 where marka_isim=isyeri) as sehir_sayisi
from markalar;


SELECT * FROM calisanlar2, markalar
WHERE calisanlar2.isyeri = markalar.marka_isim;


