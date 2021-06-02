/*zwraca ranking kierowców zawieraj¹cy imiona i nazwiska oraz zysk ze zlecen*/
SELECT s.imie,s.nazwisko, sum (z.cena_zlecenia) AS ZYSK_ZE_ZLECEN,
dense_rank() over (order by sum(z.cena_zlecenia) desc) AS RANKING
FROM zlecenie z
join klienci k on z.id_klienci = k.id
join spedytorzy s on s.id=k.id_spedytorzy
group by s.imie,s.nazwisko
order by ranking;
