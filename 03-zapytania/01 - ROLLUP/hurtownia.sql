/*Zapytanie zwraca imiona i nazwiska kierowcow ktorzy odbyli kursy dla oddzialow i sume wartosci ich zlecen dla oddzialow ktorych budzet jest powyzej sredniej*/

SELECT kierowca.imie AS "Imie kierowcy", kierowca.nazwisko AS "Nazwisko kierowcy", miejscowosc.nazwa AS "Nazwa miejscowosci", sum(zlecenie.cena) AS "Wartosc"
FROM zlecenie
JOIN kierowca on zlecenie.id_kierowca=kierowca.id
JOIN oddzial on zlecenie.id_oddzial=oddzial.id
JOIN miejscowosc on oddzial.id_miejscowosc=miejscowosc.id
WHERE oddzial.budzet>(select avg(oddzial.budzet) from oddzial)
group by ROLLUP (kierowca.imie, kierowca.nazwisko, miejscowosc.nazwa);