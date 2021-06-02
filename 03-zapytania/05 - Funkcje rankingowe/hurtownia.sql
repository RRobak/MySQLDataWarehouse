/*zwraca ranking kierowców zawieraj¹cy imiona i nazwiska oraz zysk ze zlecen*/
SELECT spedytor.imie, spedytor.nazwisko, sum(zlecenie.cena) as ZYSK_ZE_ZLECEN,
dense_rank() over (order by sum(zlecenie.cena) desc) AS RANKING
FROM zlecenie
JOIN spedytor on zlecenie.ID_spedytor=spedytor.id
GROUP BY spedytor.imie, spedytor.nazwisko
order by ranking;