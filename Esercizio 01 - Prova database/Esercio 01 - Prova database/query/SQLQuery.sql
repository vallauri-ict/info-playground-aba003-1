/*Seleziona nome,eta e salario degli impiegati che hanno un età superiore a 50anni*/
SELECT nome,eta,salario FROM Impiegato WHERE eta>50

/*selezionare le informazione degli acuisti di item=2*/
SELECT * FROM Acquisto WHERE item=2

/*nome,titolo e salario dei programmatori con salario > 1400 */
SELECT nome,titolo,salario FROM Impiegato WHERE salario<6000 AND titolo='operaio'

/* nome di tutti i Programmatori e operai */
SELECT nome FROM Impiegato WHERE titolo='programmatore' OR titolo='operaio'

/*Le diverse età degli impiegati DISTINCT prende solo 1 volta se vi sono duplicati */
SELECT DISTINCT eta FROM Impiegato

/* Stipendio medio degli impiegati  AVG(campi interressato) fa la media*/
SELECT AVG(salario) FROM Impiegato

/*Tutti i dati di impiegato ordinati per salario dal maggiore al minore DECRESCENTE */
SELECT * FROM Impiegato ORDER BY salario DESC

/* Tutti i dati di impiegato ordinati per salario e per età dal maggiore al minore salario*/
SELECT * FROM Impiegato ORDER BY salario DESC, eta DESC  

/* Tutti i dati degli impiegati di Antonio, giancarlo e Samantha*/
SELECT * FROM Impiegato WHERE nome IN ('Antonio','Giancarlo','Samantha')

/*Tutti i dati degli impiegati tranne Antonio, giancarlo e Samantha */ 
SELECT * FROM Impiegato WHERE nome NOT IN ('Antonio','Giancarlo','Samantha')

/*Tutti i dati degli impiegati con età compresa tra 20 e 30 */
SELECT * FROM Impiegato WHERE eta BETWEEN 20 AND 60

/* Per ogni acquisto il nome del cliente e il prezzo del prodotto*/
SELECT c.nome,a.prezzo FROM Cliente c, Acquisto a WHERE a.idCliente =c.idCliente
