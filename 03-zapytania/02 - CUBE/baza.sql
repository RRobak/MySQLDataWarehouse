/*Zapytanie zwraca iloœæ wykonanych zleceñ przez spedytora w danym roku*/
SELECT DISTINCT s.id AS ID_SPEDYTORA,COUNT(z.id) AS ILOSC_ZLECEN, 
EXTRACT(Year FROM o.termin) AS ROK FROM zlecenie z 
JOIN OPLATY o ON z.id = o.id_zlecenie
JOIN KLIENCI k ON z.id_klienci=k.id
JOIN SPEDYTORZY s ON k.id_spedytorzy=s.id
GROUP BY CUBE (EXTRACT(Year FROM o.termin), s.id)
Order by s.id;