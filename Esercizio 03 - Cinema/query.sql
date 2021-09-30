/* Il titolo dei film di F. Fellini prodotti dopo il 1960 */
SELECT Titolo
FROM Film
WHERE Regista = 'Fellini' AND AnnoProduzione > 1960

/* Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990 */
SELECT f.Titolo, f.Durata
FROM Film f
WHERE f.Genere = 'Fantascienza' 
AND (f.Nazionalita = 'FRA' OR f.Nazionalita = 'JPN')
AND f.AnnoProduzione > 1990

/* Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi */
SELECT f.Titolo
FROM Film f
WHERE f.Genere = 'Fantascienza' AND ((f.Nazionalita = 'JPN' AND f.AnnoProduzione > 1990) OR f.Nazionalita = 'FRA')

/* I titoli dei film dello stesso regista di “Casablanca” */
SELECT f.Titolo
FROM Film f
WHERE f.Regista = (SELECT f1.Regista FROM Film f1 WHERE f1.Titolo = 'Casablanca') /* Si possono mettere piu' query*/

/* Il titolo ed il genere dei film proiettati il giorno di Natale 2004 */
SELECT DISTINCT f.Titolo, f.Genere
FROM Film f, Proiezioni p
WHERE f.CodFilm = p.CodFilm AND p.DataProiezione = '20041225'

/* Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004 */
SELECT DISTINCT f.titolo, f.genere
FROM Film f, Sale s, Proiezioni p
WHERE f.CodFilm = p.CodFilm AND p.CodSala = s.CodSala
AND s.Citta = 'Napoli' AND p.DataProiezione = '20041225'

/* I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams */
SELECT DISTINCT s.Nome
FROM Sale s, Proiezioni p, Attori a, Recita r
WHERE p.CodSala = s.CodSala 
AND a.CodAttore = r.CodAttore
AND r.CodFilm = p.CodFilm 
AND s.Citta = 'Napoli' 
AND p.DataProiezione = '20041225' 
AND a.Nome = 'R.Williams'

/* Il titolo dei film in cui recita M. Mastroianni oppure S.Loren */
SELECT f.Titolo
FROM Film f, Recita r, Attori a
WHERE a.CodAttore = r.CodAttore 
AND f.CodFilm = r.CodFilm
AND f.CodFilm IN (SELECT f.CodFilm
FROM Film f, Recita r, Attori a
WHERE a.CodAttore = r.CodAttore
AND f.CodFilm = r.CodFilm
AND a.Nome = 'Mastroianni') 
AND a.Nome = 'Loren'

/* Soluzione 2: Cerca il nome degli attori dentro ogni film */
SELECT f.Titolo
FROM Film f
WHERE 'Mastroianni' IN (SELECT a.nome FROM Attori a, Recita r
						WHERE a.CodAttore = r.CodAttore
						AND r.CodFilm = f.CodFilm)
AND 'Loren' IN (SELECT a.nome FROM Attori a, Recita r
						WHERE a.CodAttore = r.CodAttore
						AND r.CodFilm = f.CodFilm)

/* Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala. */
SELECT f.Titolo, s.Nome 
FROM Film f, Sale s, Proiezioni p
WHERE f.CodFilm = p.CodFilm 
AND s.CodSala = p.CodSala
AND s.Citta = 'Pisa'
AND p.DataProiezione BETWEEN '20050101' AND '20050131'