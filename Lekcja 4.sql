--------------------------------Zadanie 1-----------------------------------------
Select AVG(waga) AS 'srednia waga wikingow' FROM kreatura WHERE rodzaj = 'wiking';
SELECT rodzaj, AVG(waga), COUNT(rodzaj) from kreatura GROUP BY rodzaj ORDER BY waga DESC;
 SELECT AVG (YEAR(dataUr)) FROM kreatura GROUP BY rodzaj;
------------------------------Zadanie 2---------------------------------------------
SELECT rodzaj, COUNT(waga) FROM zasob GROUP BY rodzaj ORDER BY waga DESC;
SELECT nazwa,AVG(waga),ilosc FROM zasob WHERE ilosc >= 4 GROUP BY nazwa HAVING COUNT(waga)>1;
SELECT rodzaj, COUNT(DISTINCT nazwa) AS 'ilosc nazw' FROM zasob WHERE ilosc>1 GROUP BY rodzaj;

----------------------------Zadanie 3------------------------------------------------
SELECT kreatura.nazwa, COUNT(ekwipunek.ilosc) AS 'ilosc zasobow jaka niesie' FROM kreatura JOIN ekwipunek on kreatura.idKreatury = ekwipunek.idKreatury GROUP BY kreatura.nazwa;

SELECT kreatura.nazwa, zasob.nazwa FROM kreatura JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury JOIN zasob 
ON ekwipunek.idZasobu = zasob.idZasobu ORDER BY kreatura.nazwa ASC;

SELECT kreatura.nazwa FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;
-------------------------------------------------------------------------------------------
=========================Zadanie 4 ===========================================================
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu WHERE kreatura.rodzaj="wiking" AND YEAR(kreatura.dataUr) BETWEEN 1670 AND 1679;

SELECT kreatura.nazwa FROM ekwipunek JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu JOIN kreatura ON kreatura.idKreatury=ekwipunek.idKreatury WHERE zasob.rodzaj="jezdzenie" ORDER BY kreatura.dataUr DESC LIMIT 5;
SELECT kreatura1.nazwa, kreatura2.nazwa FROM kreatura kreatura1 JOIN kreatura kreatura2 ON kreatura1.idKreatury=kreatura2.idKreatury-5;
=================================================================================================
==================================Zadanie 5=======================================================
SELECT kreatura.rodzaj, avg(zasob.waga) AS waga FROM kreatura NATURAL JOIN ekwipunek JOIN zasob on zasob.idZasobu = ekwipunek.idZasobu GROUP BY kreatura.rodzaj HAVING kreatura.rodzaj != 'malpa' AND kreatura.rodzaj != 'waz' AND SUM(ekwipunek.ilosc) < 30;
