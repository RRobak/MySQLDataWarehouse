/*Zapytanie zwraca iloœæ wykonanych zleceñ przez spedytora w danym roku*/
SELECT DISTINCT s.id AS ID_SPEDYTORA, COUNT(z.id) AS ILOSC_ZLECEN,r.rok from zlecenie z 
JOIN okres o on z.id_okres= o.id
JOIN rok r on o.id_rok=r.id
JOIN spedytor s on z.id_spedytor= s.id
GROUP BY CUBE (r.rok,s.id)
order by s.id;