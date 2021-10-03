/* Le città da cui partono voli per Roma in ordine alfabetico */
SELECT v.CittàPart FROM Volo v WHERE V.CittàArr='Roma'ORDER BY v.CittàPart;

/* Città con aeroporto con numero di piste in ordine  */
SELECT a.Città FROM Aeroporto a ORDER BY a.NumPiste DESC;

/* Per ogni volo Misto (sia merci che passeggeri): codice volo e dati di trasporto */
SELECT * FROM Aereo a, Volo v WHERE a.TipoAereo = v.TipoAereo AND a.NumPasseggeri>0 AND a.QtaMerci>0

