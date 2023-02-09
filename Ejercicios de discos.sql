--1.- Cuáles son los dos clientes con más puntuaciones efectuadas (sacándolos todos).
select 

--2.- Media de la puntuación de discos de los intérpretes que
--comiencen con A y efectuada en sábado.


--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'.


--4.- Disco (dando su título) con mayor media de puntuacion que haya sido
--votado dos o más veces.


--5.- Intérprete que más veces haya sido puntuado.


--6.- Dos intérpretes con más discos.


--7 títulos de los discos que hayan recibido
--alguna puntuación y el nombre del intérprete.



--Segunda parte
--1.- Cuál es el disco (dando el título) que tiene más tipos

select top 1 with ties Titulo,COUNT(*) as numtipo
from Disco
	inner join DiscoTipo
	on disco.IdDisco=DiscoTipo.IdDisco
group by Titulo
	order by numtipo desc
--2.- Media de la puntuación de discos de los interpretes que
-- contengan 'Jackson'.
select Titulo,Interprete,AVG(Puntuacion)
from Disco
	inner join Puntuacion
	on Disco.IdDisco=Puntuacion.iddisco
	inner join Interprete
	on Disco.IdInterprete=Interprete.IdInterprete
where Interprete like '%Jackson%'
group by Titulo,Interprete
--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
-- puntuado a los tipos que contengan 'rock'.
select Nombre
from Cliente
	inner join Puntuacion
	on Cliente.id=Puntuacion.Idcliente
	inner join Disco
	on Disco.IdDisco=Puntuacion.iddisco
	inner join DiscoTipo
	on disco.IdDisco=DiscoTipo.IdDisco
	inner join Tipo
	on DiscoTipo.IdTipo=tipo.IdTipo
	where tipo like'%rock%'and FechaNacimiento<'1975'

--4.- Disco (dando su título) con mayor media de puntuacion que haya
--sido votado dos o más veces.



--5.- Número de votos realizados por cada cliente (dando su nombre)
-- incluyéndolos todos los clientes. Ordenar por el nº de votos de
-- mayor a menor.
select Cliente.Nombre,count(Puntuacion.Id)
from Cliente
	left join Puntuacion
	on Cliente.id=Puntuacion.Idcliente
	group by Nombre
	order by COUNT(Puntuacion.Id) desc
--6.- Tipo (dando su denominación) con más discos.


--7.- Cuántos discos tiene cada intérprete (por su nombre) dando
-- todos los intérpretes, ordenado por nº de discos de mayor a menor. 
select Interprete,COUNT(Disco.Titulo)
from Interprete
	left join Disco
	on Interprete.IdInterprete=Disco.IdInterprete
group by Interprete
order by COUNT(Disco.Titulo) desc
