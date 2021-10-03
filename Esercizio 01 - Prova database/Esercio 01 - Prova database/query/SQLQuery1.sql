CREATE TABLE Acquisto(
	id INT IDENTITY(1,1) NOT NULL,
	idCliente INT NOT NULL,
	dataOrdinazione DATE NOT NULL,
	item INT NOT NULL,
	qta INT NOT NULL,
	prezzo int NOT NULL,
	PRIMARY KEY (ID)
)
CREATE TABLE Cliente(
	idCliente INT IDENTITY(1,1) NOT NULL,
	nome varchar(30) NOT NULL,
	cognome varchar(30) NOT NULL,
	citta varchar(30) NOT NULL,
	stato CHAR(3) NOT NULL,
	PRIMARY KEY(idCliente)
)

CREATE TABLE Impiegato(
		nome varchar(30) NOT NULL,
		titolo varchar(20) NULL,
		eta int not null,
		salario decimal(12,2) not null,
		dip char(1) null,
		primary key (nome)
)
/*popolazione tabella Cliente*/
INSERT INTO Cliente
VALUES ('Antonio', 'Pelissero', 'Fossano', 'IT');
INSERT INTO Cliente
VALUES ('Luca', 'Roero', 'Alba', 'IT');
INSERT INTO Cliente
VALUES ('Sliffer', 'Germano', 'Frankfurt', 'DE');
INSERT INTO Cliente
VALUES ('ivano', 'Angioleri', 'Vinita', 'MK');

/*popolazione tabella Acquisto*/
INSERT INTO Acquisto
VALUES (1, '2008-11-11', 4, 30,2000);
INSERT INTO Acquisto
VALUES (2, '2018-12-10', 5, 85,20000);
INSERT INTO Acquisto
VALUES (3, '2020-09-10', 8, 3,20800);
INSERT INTO Acquisto
VALUES (4, '2021-08-30', 15, 300,200);

/*Popolazione tabella impiegato*/
insert into Impiegato
values('Luka Panino','',30,2000,'');
insert into Impiegato
values('Paprika Bastarda','',18,2500,'');
insert into Impiegato
values('Sliffare Tetta','',22,200,'');
insert into Impiegato
values('telcomando Wirreless','',19,25000,'');

/* 1 Selezionare il nome e l'età e il salario degli impiegati con piu' di 50 anni */
SELECT i.nome, i.eta,i.salario FROM Impiegato i WHERE i.eta<=50; 

/* 2 Le informazioni degli acquisti di item = 2 */
SELECT  * FROM  Acquisto a WHERE a.item=5;

/* 3 nome,titolo e salario dei programmatori con salario > 1400 */
UPDATE Impiegato
SET titolo = 'Programmatore'
WHERE nome = 'Luka Panino';  
UPDATE Impiegato
SET titolo = 'Programmatore'
WHERE nome = 'Sliffare Tetta';
UPDATE Impiegato
SET titolo = 'Magazziniere'
WHERE nome = 'Paprika Bastarda' 
UPDATE Impiegato
SET titolo = 'Magazziniere'
WHERE nome = 'telcomando Wirreless';

select * from Impiegato i
where i.salario>1400 and i.titolo='Programmatore';

/* 4 nome di tutti i Programmatori e analisti */
select * from Impiegato i
where i.titolo='Programmatore' or i.titolo='Magazziniere'

/* 5 Le diverse età degli impiegati */
select distinct i.eta from Impiegato i /*distinct non ripete dati uguali*/

/* 6 Stipendio medio degli impiegati */
select avg(i.salario) from Impiegato i

/* 7 Tutti i dati di impiegato ordinati per salario dal maggiore al minore */
select * from Impiegato i 
order by i.salario desc  /*order by li ordina*/

/* 8 Tutti i dati di impiegato ordinati per salario e per età dal maggiore al minore*/
select * from Impiegato i
order by i.salario desc ,eta  desc /*piu ordinamenti prevale il primo*/

/* 9 Tutti i dati degli impiegati di Marta, Fabio e Ivan */
select * from Impiegato i
where nome in ('Luka','Paprika','Sliffare Tetta') /*la in equivale a multiple or*/

/* 10 Tutti i dati degli impiegati tranne Marta, Fabio e Ivan */ 
select * from Impiegato i
where nome not in ('Paprika Bastarda','Sliffare Tetta')

/* 11 Tutti i dati degli impiegati con età compresa tra 20 e 30 */
select * from Impiegato i 
where i.eta between 20 and 30

/* 12 Per ogni acquisto il nome del cliente e il prezzo del prodotto*/
select c.nome,a.prezzo as prezzoSpeso from Acquisto a , Cliente c 
where c.idCliente=a.idCliente