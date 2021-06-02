/*Zapytanie zwraca procentowy udzia oddziau w realizacji zleceñ firmy*/
SELECT DISTINCT o.id,a.miejscowosc, round(((sum(z.id)
over (PARTITION BY o.id))/( sum(z.id) over()) )*100 , 2 ) AS PROCENT
FROM oddzialy o 
join adresy a on o.id_adresy=a.id
join spedytorzy s on s.id_oddzialy=o.id
join klienci k on k.id_spedytorzy= s.id
join zlecenie z on z.id_klienci=k.id
Order by o.id, a.miejscowosc asc;