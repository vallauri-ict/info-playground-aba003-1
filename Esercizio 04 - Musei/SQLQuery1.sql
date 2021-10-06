/*il codice e il titolo delle opere di tiziano conservate al national gallery*/
select o.Codice, o.Titolo from
Opere o where o.NomeA='Tiziano' and o.NomeM='National gallery'

/*il nome dell artista e il titolo delle sue opere conervate al national gallery o agli uffizi*/
select o.NomeA, o.Titolo
from Opere o 
where o.NomeM = 'Uffizi' or o.NomeM = 'National gallery'

/*il nome e il titolo delle opere conservati nei musei di florence*/
select distinct o.NomeA,o.Titolo from
Opere o , Musei m 
where exists(select * from Musei m where m.Citta='Firenze' and m.NomeM=o.NomeM);

/*le città in cui sono conservate le opere di picasso*/
select m.Citta from
Opere o , Musei m 
where m.NomeM=o.NomeM and o.NomeA='Picasso'

select m.Citta from  Musei m  where exists(select * from Opere o where m.NomeM=o.NomeM and o.NomeA='Picasso' );

/*il codice e il titolo delle opere di tiziano conservate a londra*/
select o.Codice,o.Titolo 
from  Opere o ,Musei m
where o.NomeA='Tiziano'and  o.NomeM = m.NomeM and m.Citta='Londra'  

/*il nome e il titolo deglle opere e degli autori spagnoli conservati neiumusei di firenze */
select o.NomeA, o.Titolo from Artisti a, Musei m , Opere o
where m.NomeM=o.NomeM and o.NomeA=a.NomeA and m.Citta='Firenze' and a.Nazionalita='Spa'

/*il codice e titolo delle opere di artisti italiani conservate a londra e in cui è rappresentata la madonna*/
select o.Codice,o.Titolo 
 from Musei m, Artisti a, Personaggi p, Opere o where o.NomeM=m.NomeM and o.NomeA=a.NomeA  and p.Codice=o.Codice and a.Nazionalita='Ita'and m.Citta='Londra'and p.Personaggio='Madonna'



