-- ORDER BY KOMUTU
select * from insanlar
delete from insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

-- Insanlar tablosundaki datalari adrese gore siralayin
select * from insanlar
order by ssn;

-- Ismi mine olanlari ssn sirali listeleyin

select * from insanlar
where isim ='Mine' order by ssn;

-- Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar
where soyisim ='Bulut'
order by 2;

-- Insanlar tablosundaki tum kayitlari ssn nosu buyukten kucuge olarak siralayin
--Ascendin (asc) kucukten buyuge, descending (desc) buyukten kucuge
select * from insanlar
order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar
order by isim asc, soyisim desc;

-- oncelikle ilk sarti uygular

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

select isim, soyisim from insanlar
order by length(soyisim)

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT (isim,' ',soyisim) AS isim_soyisim FROM insanlar
ORDER BY LENGTH(isim)+LENGTH(soyisim)
-- ikinci Yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar
ORDER BY LENGTH(isim||soyisim)
----------------------

CREATE TABLE manav
(
isim varchar(50), Urun_adi varchar(50), Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);


---- GROUP BY

SELECT isim, sum(urun_miktar) FROM manav
GROUP BY isim
ORDER BY isim

--2) Urun ismine gore urunu alan toplam kisi sayisi

select urun_adi, count(isim) from manav
group by urun_adi

--3) Alinan kilo miktarina gore musteri sayisi

select urun_miktar,count(isim) as alinan_urunler_kisi_sayisi from manav
group by urun_miktar

---


CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel

-- isme gore toplam maaslari bulun

select isim, sum(maas) from personel
group by isim

--sehre gore toplam personel sayisi

select sehir, count (isim) as calisan_sayisi from personel
group by sehir

-- sirketlere gore maasi 5000 den fazla olan personel sayisini bulun

select sirket, count (isim) from personel 
where maas >5000
group by sirket

-- her sirket icin min max maasi bulun
select sirket, min(maas) as en_dusuk_maas, max(maas) as en_yuksek_maas from personel 
group by sirket;

--HAVING KOMUTU
-- Her sirketin min maaslarini eger 3500den buyukse goster
select sirket, min (maas) as en_dusuk_maas from personel
group by sirket
having min(maas) >3500

-- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz

select isim, sum (maas) as toplam_maas from personel
group by isim
having sum(maas) > 10000;

--