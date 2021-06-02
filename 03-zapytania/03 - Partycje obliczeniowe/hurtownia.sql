/*Zapytanie zwraca procentowy udzia oddziau w realizacji zleceñ firmy*/
SELECT DISTINCT oddzial.id, miejscowosc.nazwa, round(((sum(zlecenie.id) over (PARTITION BY oddzial.id))/( sum(zlecenie.id) over()) )*100 , 2 ) AS PROCENT
FROM oddzial
JOIN zlecenie on zlecenie.id_oddzial=oddzial.id
JOIN miejscowosc on oddzial.id_miejscowosc=miejscowosc.id
Order by oddzial.id, miejscowosc.nazwa asc;