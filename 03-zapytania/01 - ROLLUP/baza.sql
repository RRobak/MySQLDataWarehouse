/*Zapytanie zwraca imiona i nazwiska kierowcow ktorzy odbyli kursy dla oddzialow i sume wartosci ich zlecen dla oddzialow ktorych budzet jest powyzej sredniej*/
SELECT kierowcy.imie AS "Imie kierowcy", kierowcy.nazwisko AS "Nazwisko kierowcy", adresy.miejscowosc AS "Nazwa miejscowosci", sum(zlecenie.cena_zlecenia) AS "Wartosc"
FROM kierowcy
JOIN spedytorzy on kierowcy.id_spedytorzy=spedytorzy.id
JOIN oddzialy on spedytorzy.id_oddzialy=oddzialy.id
JOIN adresy on oddzialy.id_adresy=adresy.id
JOIN klienci on klienci.id_spedytorzy=spedytorzy.id
JOIN zlecenie on zlecenie.id_klienci=klienci.id
WHERE oddzialy.budzet>(select avg(oddzialy.budzet) from oddzialy)
group by ROLLUP (kierowcy.imie, kierowcy.nazwisko, adresy.miejscowosc);