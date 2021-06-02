/*zwraca imiê oraz nazwisko spedytora, iloœæ wykonanych przez niego zleceñ w miesi¹cu oraz ich sumê w danym roku*/
select DISTINCT imie,nazwisko,miesiac, rok,
count(id) over (partition by id,rok,miesiac) as WYKONANE_PRZEZ_MIESIAC,
count(id) over (partition BY id,rok order by id,miesiac RANGE BETWEEN unbounded preceding AND CURRENT ROW) AS WYKONANE_PRZEZ_ROK
from (SELECT s.id as id,s.imie as imie,s.nazwisko as nazwisko, extract(year from o.termin) as rok, round(extract( month from o.termin)) AS miesiac,cena_zlecenia
from zlecenie z 
join klienci k on z.id_klienci=k.id
join oplaty o on z.id=o.id_zlecenie
join spedytorzy s on k.id_spedytorzy = s.id) order by imie,nazwisko,rok,miesiac;