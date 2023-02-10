--1.- Cu�les son los dos clientes con m�s puntuaciones efectuadas (sac�ndolos todos).
select top 2 Nombre,Puntuacion
from Cliente
	inner join Puntuacion
	on Puntuacion.Id = Cliente.id
group by Nombre,Puntuacion

--2.- Media de la puntuaci�n de discos de los int�rpretes que
--comiencen con A y efectuada en s�bado.
select Interprete,AVG(Puntuacion) as media,DATENAME(DW,fecha) fecha
from Puntuacion
	inner join Disco
	on Disco.IdDisco = Puntuacion.iddisco
	inner join Interprete
	on Interprete.IdInterprete = Disco.IdInterprete
	where Interprete like 'A%' and DATENAME(DW,Fecha)='s�bado'
group by Interprete,fecha

--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'.
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

--4.- Disco (dando su t�tulo) con mayor media de puntuacion que haya sido
--votado dos o m�s veces.
select top 1 Titulo,AVG(Puntuacion),COUNT(*)
from Disco
	inner join Puntuacion
	on Puntuacion.iddisco=Disco.IdDisco
group by Titulo
having COUNT(*)>='2'
order by avg(Puntuacion) desc
--5.- Int�rprete que m�s veces haya sido puntuado.
select top 1 Interprete, count(*) as puntuacion
from Interprete
	inner join Disco
	on Interprete.IdInterprete = Disco.IdInterprete
	inner join Puntuacion
	on Disco.IdDisco = Puntuacion.iddisco
group by Interprete	
order by puntuacion desc

--6.- Dos int�rpretes con m�s discos.
select top 2 with ties Interprete, count (Titulo) as discos
from Interprete
	inner join Disco
	on Interprete.IdInterprete = Disco.IdInterprete
group by Interprete
order by discos desc

--7 t�tulos de los discos que hayan recibido
--alguna puntuaci�n y el nombre del int�rprete.



--Segunda parte
--1.- Cu�l es el disco (dando el t�tulo) que tiene m�s tipos

select top 1 with ties Titulo,COUNT(*) as numtipo
from Disco
	inner join DiscoTipo
	on disco.IdDisco=DiscoTipo.IdDisco
group by Titulo
	order by numtipo desc

--2.- Media de la puntuaci�n de discos de los interpretes que
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
--4.- Disco (dando su t�tulo) con mayor media de puntuacion que haya
--sido votado dos o m�s veces.
select top 1 Titulo,AVG(Puntuacion),COUNT(*)
from Disco
	inner join Puntuacion
	on Puntuacion.iddisco=Disco.IdDisco
group by Titulo
having COUNT(*)>='2'
order by avg(Puntuacion) desc
--5.- N�mero de votos realizados por cada cliente (dando su nombre)
-- incluy�ndolos todos los clientes. Ordenar por el n� de votos de
-- mayor a menor.
select Cliente.Nombre,count(Puntuacion.Id)
from Cliente
	left join Puntuacion
	on Cliente.id=Puntuacion.Idcliente
	group by Nombre
	order by COUNT(Puntuacion.Id) desc
--6.- Tipo (dando su denominaci�n) con m�s discos.


--7.- Cu�ntos discos tiene cada int�rprete (por su nombre) dando
-- todos los int�rpretes, ordenado por n� de discos de mayor a menor. 
select Interprete,COUNT(Disco.Titulo)
from Interprete
	left join Disco
	on Interprete.IdInterprete=Disco.IdInterprete
group by Interprete
order by COUNT(Disco.Titulo) desc
