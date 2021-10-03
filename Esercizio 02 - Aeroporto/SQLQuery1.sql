create table Volo (
	idVolo int  identity(1,1) not null,
	giornoSett varchar(10) not null,
	cittàPart varchar(20) not null,
	oraPart time  not null,
	cittàArr varchar(20) not null,
	oraArr  time  not null,
	tipoAereo varchar(30) not null,
	primary key (idVolo)
)
create table Aeroporto (
	città varchar(20)  not null,
	stato varchar(3) not null,
	numPiste int  null,
	primary key (città)
)
create table Aereo (
	tipoAereo varchar(30) not null,
	numPasseggeri int  not null,
	qtaMerci int not null,
	primary key (tipoAereo)
)

insert into Volo 
values('Lunedì','Napoli','13:30','Roma','15:30','Boeing 747');
insert into Volo 
values('Martedì','Milano','15:30','Napoli','18:30','Boeing 757');
insert into Volo 
values('Sabato','Torino','13:30','Roma','15:30','Boeing 767');
insert into Volo 
values('Domenica','Genova','19:30','Lisbona','22:30','Boeing 777');

insert into Aeroporto 
values('Napoli','IT',4);
insert into Aeroporto 
values('Genova','IT',14);
insert into Aeroporto 
values('Torino','IT',24);
insert into Aeroporto 
values('Milano','IT',8);

insert into Aereo 
values('Boeing 747',200,4000);
insert into Aereo 
values('Boeing 757',320,1400);
insert into Aereo 
values('Boeing 767',700,0);
insert into Aereo 
values('Boeing 777',0,120000);

/*Queries*/
/* Le città da cui partono voli per Roma in ordine alfabetico */
select distinct v.cittàPart from Volo v 
where v.cittàArr ='Roma' 
order by v.cittàPart

/* Città con aeroporto con numero di piste non noto */
select distinct a.città from Aeroporto a
where a.numPiste is NULL; /*is null per checkare se è null*/

/* Per ogni volo Misto (sia merci che passeggeri): codice volo e dati di trasporto */
select v.idVolo as codiceDiVolo , a.numPasseggeri as passeggeri, a.qtaMerci as quantitàMerci 
from Volo v , Aereo a
where v.tipoAereo = a.tipoAereo 
and a.qtaMerci>0 and a.numPasseggeri>0

