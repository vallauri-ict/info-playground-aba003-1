/*per ciascun museo di londra il numero di opere di artisti italiani*/
SELECT m.NomeM,COUNT (*) as numeroOpere
FROM Artisti a, Musei m,Opere o 
WHERE m.Citta='Londra' AND 
a.Nazionalita='IT' AND 
a.NomeA=o.NomeA AND m.NomeM=o.NomeM 
GROUP BY m.NomeM

SELECT * FROM Artisti a, Musei m, Opere o
WHERE a.NomeA =o.NomeA AND m.NomeM =o.NomeM AND
m.Citta='Londra' AND a.Nazionalita='IT'

/*il nome dei musei di londra che non hanno opere di tiziano*/  
SELECT  m.NomeM
FROM  Musei m 
WHERE m.Citta='Londra' AND NOT EXISTS(SELECT * FROM Opere o WHERE o.NomeA='Tiziano' AND o.NomeM=m.NomeM);

/*il nome dei musei di londra che solo hanno opere di tiziano*/
SELECT m.NomeM
FROM Musei m 
WHERE m.Citta='Londra' AND NOT EXISTS(SELECT * FROM Opere o WHERE o.NomeA<>'Tiziano' AND o.NomeM=m.NomeM)

/*per ciascun artista il nome e il nuemro delle sua opere conservate agli uffizi*/
SELECT o.NomeA , count(*) as numeroOpere
FROM Opere o 
WHERE o.NomeM='Uffizi'
GROUP BY o.NomeA

/*i musei che conservano almeno 20 opere di musei italiani*/
