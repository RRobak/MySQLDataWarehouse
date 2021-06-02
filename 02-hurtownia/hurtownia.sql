DROP TABLE zlecenie CASCADE CONSTRAINTS;
DROP TABLE miesiac CASCADE CONSTRAINTS;
DROP TABLE rok CASCADE CONSTRAINTS;
DROP TABLE okres CASCADE CONSTRAINTS;
DROP TABLE spedytor CASCADE CONSTRAINTS;
DROP TABLE kierowca CASCADE CONSTRAINTS;
DROP TABLE oddzial CASCADE CONSTRAINTS;
DROP TABLE miejscowosc CASCADE CONSTRAINTS;
DROP TABLE wojewodztwo CASCADE CONSTRAINTS;
DROP TABLE samochod CASCADE CONSTRAINTS;

CREATE TABLE samochod(
    id number(3),
    marka varchar2(30),
    rok_produkcji number(4),
    ladownosc_naczepy number(6),
    CONSTRAINT samochod_01 PRIMARY KEY (id),
    CONSTRAINT samochod_03 CHECK (rok_produkcji>1990)
);
/
CREATE TABLE wojewodztwo(
    id number(2),
    nazwa varchar2(30),
    CONSTRAINT wojewodztwo_01 PRIMARY KEY(id)
);
/
CREATE TABLE miejscowosc(
    id number(3),
    nazwa varchar2(30),
    id_wojewodztwo number(2),
    CONSTRAINT miejscowosc_01 PRIMARY KEY(id),
    CONSTRAINT miejscowosc_02 CHECK (nazwa=INITCAP(nazwa)),
    CONSTRAINT miejscowosc_03 FOREIGN KEY (id_wojewodztwo) REFERENCES wojewodztwo(id)
);
CREATE TABLE oddzial(
    id number(3),
    budzet number(20),
    kod_pocztowy varchar2(30),
    id_miejscowosc number(4),
    CONSTRAINT oddzial_01 PRIMARY KEY (id),
    CONSTRAINT oddzial_05 CHECK (kod_pocztowy like '%-%'),
    CONSTRAINT oddzial_04 FOREIGN KEY (id_miejscowosc) REFERENCES miejscowosc(id)
);
/
CREATE TABLE kierowca(
    id number(3),
    imie varchar2(30),
    nazwisko varchar2(30),
    zarobki number(9,2),
    id_samochod number(4),
    CONSTRAINT kierowca_01 PRIMARY KEY (id),
    CONSTRAINT kierowca_02 CHECK (imie=INITCAP(imie)),
    CONSTRAINT kierowca_03 CHECK (nazwisko=INITCAP(nazwisko)),
    CONSTRAINT kierowca_04 FOREIGN KEY (id_samochod) REFERENCES samochod(id)
);
/
CREATE TABLE spedytor(
    id number(3),
    imie varchar2(30),
    nazwisko varchar2(30),
    zarobki number(9,2),
    CONSTRAINT spedytor_01 PRIMARY KEY (id),
    CONSTRAINT spedytor_02 CHECK (imie=INITCAP(imie)),
    CONSTRAINT spedytor_03 CHECK (nazwisko=INITCAP(nazwisko))
);
/
CREATE TABLE miesiac(
   id number(2),
   miesiac varchar2(12),
   CONSTRAINT miesiac_01 PRIMARY KEY (id)
);
/
CREATE TABLE rok(
   id number(2),
   rok number(4),
   CONSTRAINT rok_01 PRIMARY KEY (id),
   CONSTRAINT rok_02 CHECK (rok>1990)
);
CREATE table okres(
    id number(4),
    id_miesiac number(2),
    id_rok number(2),
    CONSTRAINT okres_01 PRIMARY KEY (id),
    CONSTRAINT okres_02 FOREIGN KEY (id_miesiac) REFERENCES miesiac(id),
    CONSTRAINT okres_03 FOREIGN KEY (id_rok) REFERENCES rok(id)
);
/
CREATE table zlecenie
(
    id number(5),
    cena number(7, 2),
    status varchar2(30),
    stan_oplaty varchar2(30),
    id_kierowca number(3),
    id_spedytor number(3),
    id_oddzial number(3),
    id_okres  number(3),
    CONSTRAINT zlecenie_01 PRIMARY KEY (id),
    CONSTRAINT zlecenie_02 FOREIGN KEY (id_kierowca) REFERENCES kierowca (id),
    CONSTRAINT zlecenie_03 FOREIGN KEY (id_spedytor) REFERENCES spedytor (id),
    CONSTRAINT zlecenie_04 FOREIGN KEY (id_oddzial) REFERENCES oddzial (id),
    CONSTRAINT zlecenie_05 FOREIGN KEY (id_okres) REFERENCES okres (id)
);
