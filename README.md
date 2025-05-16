# Mokkiprojekti

Tämä ohje sisältää kaksi (2) osiota: 
Ohjelman käyttö- ja asennusohje
Ohjelman toiminnallisuudet



Ohjelman käyttö- ja asennusohje

1)
Luo uusi IntelliJ -projekti nimellä ’ohtu’ ja anna projektin alustuksessa Group -kohtaan nimeksi ’projekti’. Mikäli et syötä Groupia alustuksen yhteydessä, voit tyhjentää kaikista ohjelman luokista punaisella herjaavan kohdan koskien projektin importtia pois. Alla esimerkki:

Ennen tyhjennystä 

import.projekti.ohtu.LUOKAN_NIMI

Tyhjennyksen jälkeen

import.ohtu.LUOKAN_NIMI

(tai muuta oman Group -nimesi mukaiseksi).


2)
Mikäli pom-tiedostosta ei löydy tätä riippuvuutta, lisääthän sen manuaalisesti <dependencies> ja </dependencies> kohtien väliin:

<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
</dependency>

Tämän jälkeen synkronoi Maven -projekti IntelliJ:ssä näkymän oikeasta reunasta Mavenin logon (M) -päältä ja klikkaa synkronointia esittävää kuvaketta (ympyrää kiertävät nuolet).


3)
Klikkaa ’add requires java.sql directive to module-info.java’ Tietokanta -luokassa varmistaaksesi ohjelman toimimisen.


4)
Vaihda luokassa Tietokanta omaa MySQL-serveriäsi vastaavat tiedot, kuten salasana.


5)
Tallenna repositoriosta löytyvä Kuva1.jpg sinulle sopivaan paikkaan ja sijoita tämän jälkeen tallentamasi kuvan tiedostopolku koodin luokkaan ’Paaohjelma’ otsikoitua kohtaa // Taustakuva seuraavalle riville, esimerkkitiedostopolun päälle. Huom! Jätä hakupolkuun etuliite file:


6)
Poistaessasi varauksen ohjelmassa, tulee myös kaikki varaukseen liittyvät laskut poistaa. Lisääthän siis tämän komennon MySQL -ohjelmassasi, tietokannassa mokkiprojekti ennen varausten poistamista:

ALTER TABLE lasku ADD CONSTRAINT FK_lasku_varaus FOREIGN KEY (varaus_id)
REFERENCES varaus(varaus_id) ON DELETE CASCADE;


7)
Poistaessasi asiakkaan, tulee myös kaikki hänen varauksensa poistaa. Lisääthän siis tämän komennon MySQL -ohjelmassasi, tietokannassa mokkiprojekti ennen asiakkaan poistamista:

ALTER TABLE varaus
ADD CONSTRAINT varaus_ibfk_1 FOREIGN KEY (asiakas_id)
REFERENCES asiakas(asiakas_id)


8)
Käännä ja aja ohjelma. Voit tehdä valintoja käyttöliittymällä mielesi mukaan. 




Ohjelman toiminnallisuudet

Ohjelmassa on kuusi (6) näkymää:

-Aloitusnäkymä
-Mökkien hallinta
-Asiakashallinta
-Varausten hallinta
-Laskujen hallinta
-Raportit


Näkymästä 1 (aloitusnäkymä) pääset siirtymään kaikkiin viiteen muuhun näkymään painikkeiden avulla. 


Näkymässä 2 (mökkien hallinta) pääsee tarkastelemaan yrityksen Mökkikodit hallinnoimia mökkejä ja niiden tietoja. 

Mökkien tiedot esitetään taulukon muodossa:
-mökin ID 
-osoite
-kapasiteetti
-varustelu
-hinta/yö


Näkymässä 3 (asiakashallinta) pystyy tarkastelemaan asiakkuuksia, luomaan uusia sekä poistamaan tarpeettomia. Asiakkaista muodostuu yksilöintitunniste eli asiakas ID aina luomisen yhteydessä. 

Asiakashallinta sisältää taulukon, jossa tiedot esitetään. Taulukon lisäksi siinä on kolme teksikenttää:

-Koko nimi
-Puhelinnumero
-Sähköpostiosoite

Kun asiakas poistetaan, myös kaikki hänen varauksensa poistetaan [kts. käyttö ja asennusohjeen kohta 7].


Näkymässä 4 (varausten hallinta) on mahdollista tarkastella tehtyjä varauksia ja niiden tietoja. Tarpeettomia tai vanhoja varauksia voi myös poistaa tässä näkymässä. Tämä näkymä on myös uusien varausten tekemistä varten. 

’Valitse varattava mökki’ listassa valittuna ajankohtana varatut kohteet näkyvät punaisella. Varattavat ja siten vapaat mökit näkyvät puolestaan vihreällä.

Voit etsiä olemassa olevia asiakkaita näkymässä asiakkaan nimellä. Kun valitset olemassa olevan asiakkaan nimihaun perusteella, täydentyy asiakkaan tiedot näkymään. Mikäli perustat kokonaan uuden asiakkaan, perustuu se automaattisesti myös asiakashallinta -näkymän puolelle.

Jokaisesta uudesta varauksesta muodostuu uniikki 8-numeroinen varaustunnus eli ID.

Kun varaus poistetaan, myös kaikki varaukseen liittyvät laskut poistetaan [kts. käyttö ja asennusohjeen kohta 6].



Näkymässä 5 (laskujen hallinta) voi tarkastella laskuja. Laskutus tapahtuu manuaalisesti ja uusia laskuja luodaan varaus ID numeron perusteella.

Ohjelmassa uutta laskua tehdessä on ensin syötettävä kelvollinen varaus ID. Varaus ID:n syöttämisen jälkeen ohjelma laskee automaattisesti varauksen keston ja kohteen perusteella laskulle summan. Eräpäivä on itse määriteltävissä, mutta syötäthän sen muodossa PP.KK.VVVV.

Näkymässä voi myös poistaa laskuja ja muokata niitä eli toisin sanoen lisätä laskulle eräpäivän (muut muokkaukset on estetty). Muokkaus tapahtuu siten, että aktivoit taulukosta halutun laskurivin, syötät maksupäivän muodossa VVVV.KK.PP ja painat ’muokkaa laskua’ -painiketta. Tällöin maksupäivä päivittyy myös tietokantaan, taulukko näkymään sekä raportteihin ohjelmassa.


Näkymässä 6 (raportit) on mahdollista tarkastella kolmea (3) eri raporttia; suosituin mökki, keskimääräisen varausajan kehittyminen kuukausittain sekä laskujen tila (saatavat ja suoritukset). 
