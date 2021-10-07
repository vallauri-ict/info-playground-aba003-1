CREATE TABLE Automobile(
	Targa varchar(30) not null,
	Marca varchar(30) not null,
	Cilindrata int not null,
	Potenza int not null,
	CodF int not null,
	CodAss int not null,
	primary key(Targa),
	CONSTRAINT FK_CodF FOREIGN KEY (CodF) REFERENCES Proprietari(CodF),
	CONSTRAINT FK_CodAss foreign key (CodAss) references Assicurazioni(CodAss)
);

create table Proprietari(
	CodF int not null,
	Nome varchar(30)  not null,
	Residenza varchar(30) not null,
	primary key (CodF)
)

create table Assicurazioni(
	CodAss int not null,
	Nome varchar(30) not null,
	Sede varchar(30) not null,
	primary key(CodAss)
)

create table Sinistro (
	CodS int not null,
	Località varchar(30) not null,
	DataSinistro date  not null,
	primary key (CodS)
)

create table AutoCoinvolte(
  CodS int not null,
  Targa varchar(30) not null, 
   ImportoDelDanno int not null,
  primary key(CodS),
  CONSTRAINT FK_CodS foreign key (CodS) references Sinistro(CodS),
  CONSTRAINT FK_Targa foreign key (Targa) references Automobile(Targa)
)

