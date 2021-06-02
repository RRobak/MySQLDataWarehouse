/*zwraca imiê oraz nazwisko spedytora, iloœæ wykonanych przez niego zleceñ w miesi¹cu oraz ich sumê w danym roku*/
select DISTINCT imie,nazwisko,miesiac, rok,
count(id) over (partition by id,rok,miesiac) as WYKONANE_PRZEZ_MIESIAC,
count(id) over (partition BY id,rok order by id,miesiac RANGE BETWEEN unbounded preceding AND CURRENT ROW) AS WYKONANE_PRZEZ_ROK
from (SELECT s.id as id, s.imie as imie,s.nazwisko as nazwisko, r.rok as rok, m.id AS miesiac, cena
from zlecenie z 
join okres o on z.id_okres= o.id
join rok r on o.id_rok=r.id
join miesiac m on o.id_miesiac=m.id
join spedytor s on z.id_spedytor = s.id) order by imie,nazwisko,rok,miesiac;