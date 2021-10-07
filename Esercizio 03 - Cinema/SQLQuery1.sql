/*il nome di tutte le sale a pisa*/
select * from Sale s where s.Citta='Pisa';

/*il titolo di fellini prodotti dopo il 1960*/
select f.Titolo from Film f where f.[Anno Produzione]>1960 and f.Regista='Fellini';

/*il titolo  dei film di fantascienza giapponesi e francesi prodotti dopo il 1990*/
select f.Titolo from Film f where f.[Anno Produzione]>1990 
and f.Nazionalita='Jap' or f.Nazionalita='Fra' and f.Genere='Frantascienza';

/*titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi */
select f.Titolo
from Film f
where (f.Nazionalita='Jap' and f.[Anno Produzione]>1990 and f.Genere='Fantascienza') or f.Nazionalita='Fra';

/*il titolo dei film dello stesso regista di casablanca*/
select f.Titolo
from Film f
where f.Regista=(select f.Regista from Film f where f.Titolo='Casablanca');

/*il titolo ed il genere dei film proiettati a napoli nel 2020 */
select f.Titolo,f.Genere
from Film f, Proiezioni p, Sale s
where p.CodFilm=f.CodFilm and p.CodSala=s.CodSala and s.Citta='Napoli' and p.DataProiezione=2020;

/*la stessa cosa ma un attore è robbin williams*/
select f.Titolo,f.Genere
from Film f, Proiezioni p, Sale s, Recita r,Attori a
where a.CodAttore=r.CodAttore and r.CodFilm=f.CodFilm and s.CodSala=p.CodSala and p.CodFilm=f.CodFilm
and a.Nome='Williams' and s.Citta='Napoli' and p.DataProiezione=2020;

/*titolo dei film in cui recita mastroianni o lauren*/
select f.titolo
from Film f ,Recita r , Attori a
where (a.Nome='Mastroianni'
and a.CodAttore=r.CodAttore
and r.CodFilm=f.CodFilm)
or(a.Nome='Loren' 
and a.CodAttore=r.CodAttore
and r.CodFilm=f.CodFilm)

/*per ogni film di fantascienz ail titolo e l' incasso totale di tutte le proiezioni*/
select f.titolo,SUM(p.incasso)
from Film f, Proiezioni p
where f.CodFilm=p.CodFilm and f.Genere='Fantascienza'
group by f.Titolo

/*i titoli dei film che non sono mai stati proiettati a pisa
select disat f.titolo
from Film f, Proiezioni p, Sale s
where  f.CodFilm=p.CodFilm and p.CodSala=s.CodSala and s.Citta<>'Pisa';*/

/*i film proiettati prima del 2021*/
select f.Titolo from Film f, Proiezioni p
where f.CodFilm =p.CodFilm and p.DataProiezione<2021

select f.titolo from Film f 
where f.CodFilm
in (select p.CodFilm from Proiezioni p where p.DataProiezione<2021)

/*find the name of the suppliers who supply at least 1 food category*/
select s.name from
product p, supplier s where s.Id=p.supplier_id and p.category='food'
group by s.name having COUNT(*)>=1;

select name from supplier where exists(select * from product where category='food' and supplier.Id=supplier_id); 
 /*suppliers with only product under 2 dollar*/
select name 
from supplier where not exists(select * from product where price>2 and supplier_id=supplier.Id)



