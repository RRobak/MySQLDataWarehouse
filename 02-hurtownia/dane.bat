cd dane
cd ctl
@echo OFF
set /p login=Podaj login. 
set /p haslo=Podaj haslo. 
SQLLDR %login%/%haslo%@localhost/xe CONTROL='samochod.TXT' LOG='..\log\samochod.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='kierowca.TXT' LOG='..\log\kierowca.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='spedytor.TXT' LOG='..\log\spedytor.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='miesiac.TXT' LOG='..\log\miesiac.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='rok.TXT' LOG='..\log\rok.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='wojewodztwo.TXT' LOG='..\log\wojewodztwo.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='miejscowosc.TXT' LOG='..\log\miejscowosc.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='okres.TXT'  LOG='..\log\okres.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='oddzial.TXT' LOG='..\log\oddzial.LOG'
SQLLDR %login%/%haslo%@localhost/xe CONTROL='zlecenie.TXT' LOG='..\log\zlecenie.LOG'
pause
