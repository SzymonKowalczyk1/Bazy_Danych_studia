
------------------------------Zadanie 1--------------------------------------
CREATE TABLE postac (id_postaci INT AUTO_INCREMENT NOT NULL PRIMARY KEY, nazwa VARCHAR(40),rodzaj ENUM('wiking','ptak','kobieta'), data_ur DATE, wiek INT UNSIGNED);
INSERT INTO postac VALUES ('0','Bjorn','wiking','1970-08-30','50');
INSERT INTO postac VALUES ('0','Drozda','ptak','2000-08-30','23');
INSERT INTO postac VALUES ('0','Tesciowa','kobieta','1950-08-30','80');
UPDATE postac SET wiek = 88 WHERE nazwa = 'Tesciowa';
-----------------------------------------------------------------------------
------------------------------Zadanie 2--------------------------------------
CREATE TABLE walizka (id_walizki INT AUTO_INCREMENT PRIMARY KEY, pojemnosc INT UNSIGNED, kolor ENUM('rozowy','czerwony','teczowy','zolty'), id_wlasciciela INT, FOREIGN KEY(id_wlasciciela) REFERENCES POSTAC (id_postaci) ON DELETE CASCADE);
ALTER TABLE walizka ALTER COLUMN kolor SET DEFAULT "rozowy";
INSERT INTO walizka (id_walizki,pojemnosc,kolor,id_wlasciciela) VALUES ('0','5','rozowy','1');
INSERT INTO walizka (id_walizki,pojemnosc,kolor,id_wlasciciela) VALUES ('0','2','zolty','3');
-----------------------------------------------------------------------------
------------------------------Zadanie 3--------------------------------------
CREATE TABLE izba (adres_budynku VARCHAR(50),nazwa_izby VARCHAR (50),metraz INT UNSIGNED,wlasciciel INT REFERENCES POSTAC (id_postaci) ON DELETE SET NULL, PRIMARY KEY (adres_budynku,nazwa_izby));
ALTER TABLE izba ADD COLUMN kolor VARCHAR(40) DEFAULT "czarny" AFTER metraz;
INSERT INTO izba (adres_budynku,nazwa_izby,metraz,wlasciciel) VALUES ('Piotrowskiego 31','spizarnia','40','1');
-----------------------------------------------------------------------------

------------------------------Zadanie 4--------------------------------------
CREATE TABLE przetwory (id_przetworu INT PRIMARY KEY,rok_produkcji YEAR DEFAULT "1904",id_wykonawcy INT, FOREIGN KEY(id_wykonawcy) REFERENCES postac (id_postaci),zawartosc VARCHAR(50),dodatek VARCHAR(50) DEFAULT "papryczka chilli",id_konsumenta INT, FOREIGN KEY (id_konsumenta) REFERENCES postac (id_postaci));
 
INSERT INTO przetwory (id_przetworu,rok_produkcji,id_wykonawcy,zawartosc,dodatek,id_konsumenta) VALUES ('0',DEFAULT,'1','Bigos',DEFAULT,'1');
-----------------------------------------------------------------------------


------------------------------Zadanie 5--------------------------------------
INSERT INTO postac (id_postaci,nazwa,rodzaj,data_ur,wiek) VALUES ('0','Andrzej','wiking','1980-03-02','40');
INSERT INTO postac (id_postaci,nazwa,rodzaj,data_ur,wiek) VALUES ('0','Wieslaw','wiking','1960-02-02','60');
INSERT INTO postac (id_postaci,nazwa,rodzaj,data_ur,wiek) VALUES ('0','Krzysztof','wiking','1980-04-02','40');
INSERT INTO postac (id_postaci,nazwa,rodzaj,data_ur,wiek) VALUES ('0','Robert','wiking','1990-09-08','30');
INSERT INTO postac (id_postaci,nazwa,rodzaj,data_ur,wiek) VALUES ('0','Piotr','wiking','1950-09-08','80');

 CREATE TABLE statek (nazwa_statku VARCHAR(70) PRIMARY KEY,rodzaj_statku ENUM('okret','langskip'),data_wodowania DATE,max_ladownosc INT UNSIGNED);
INSERT INTO statek VALUES ('CzarnaPerla','okret','2022-11-10','2000');
INSERT INTO statek VALUES ('drakar','langskip','2022-11-09','4000');
 ALTER TABLE postac ADD COLUMN funkcja varchar(50) AFTER rodzaj;
UPDATE postac set funkcja = 'Kapitan' WHERE id_postaci = 1;

ALTER TABLE postac ADD COLUMN statek VARCHAR(40);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);
UPDATE postac SET statek='CzarnaPerla' WHERE rodzaj='wiking';
UPDATE postac SET statek='drakar' WHERE nazwa='drozd';

DELETE FROM izba WHERE nazwa_izby = 'spizarnia';
DROP TABLE izba;
