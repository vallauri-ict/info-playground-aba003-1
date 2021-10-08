/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
select a.Targa as Targa , a.Marca as Marca from Automobile a where a.Cilindrata>2000 and a.Potenza>120

/*Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV*/
select p.Nome as Nome ,a.Targa  from Automobile a, Proprietari p where a.Cilindrata>2000 and a.Potenza>120 and p.CodF=a.CodF;

/*Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza
superiore a 120 CV, assicurate presso la “San paolo”*/

select p.Nome as Nome ,a.Targa  from Automobile a, Proprietari p,Assicurazioni ass where a.Cilindrata>2000 and a.Potenza>120 and p.CodF=a.CodF and a.CodAss=ass.CodAss and ass.Nome='Axa' 

/*Targa e Nome del proprietario delle Auto assicurate presso la “San Paolo” e coinvolte in sinistri il 28/02/2020*/
select a.Targa,p.Nome from Sinistro s, Proprietari p, Automobile a, AutoCoinvolte autCoinv, Assicurazioni ass where s.CodS=autCoinv.CodS and a.CodF=p.CodF and a.CodAss =ass.CodAss 
and a.Targa= autCoinv.Targa and ass.Nome='San Paolo' and s.DataSinistro='2020-02-28'

/*Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate*/
select ass.Nome,ass.Sede, COUNT(*) from Assicurazioni ass, Automobile a where a.CodAss=ass.CodAss group by ass.Nome , ass.Sede;

/*Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta*/
select a.Targa, COUNT(*) from Automobile a,Sinistro s , AutoCoinvolte autoCoinvolte where a.Targa=autoCoinvolte.Targa and autoCoinvolte.CodS=s.CodS and a.Marca='Fiat' group by a.Targa

/*Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’ Assicurazione
ed il totale dei danni riportati*/