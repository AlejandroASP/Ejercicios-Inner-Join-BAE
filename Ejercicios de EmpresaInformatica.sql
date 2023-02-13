--1.- Artículo que más unidades en total se ha vendido sin considerar los de tipos que contengan
--'ALMACENAMIENTO' ni los de 'VARIOS'
select top 1 Tipo,sum(Cantidad) as comprado
from Componente
	inner join TipoComponente
	on Componente.CodTipo = TipoComponente.CodTipo
	inner join FacturaComponente
	on Componente.precio = FacturaComponente.Cantidad
	where Tipo like '%ALMACENAMIENTO%' and Tipo not like '%VARIOS%'
group by Tipo
--2.- Tienda con mayores ventas en importe
select top 1 NombreTienda, COUNT(*) as NumMayorVentas
from Tienda
	inner join Factura
	on tienda.IdTienda = Factura.idTienda
	inner join FacturaComponente
	on Factura.NFactura = FacturaComponente.NFactura
group by NombreTienda

--3.- Tienda con mayor número de facturas realizadas (sacar todas las que coincidan)
select top 1 with ties NombreTienda,count(Cantidad)
from Tienda
	inner join Factura
	on tienda.IdTienda = Factura.idTienda
	inner join FacturaComponente
	on Factura.NFactura = FacturaComponente.NFactura
group by NombreTienda
order by NombreTienda
--4.- Artículos vendidos, dando su nombre, indicando el nº de veces que referencia esté a NULL

--5.- Importe de las facturas de las tiendas de Localidad 'La Laguna'

--6.- Nº de componentes vendidos por tipo de los tipos que contengan 'impresora'

--7.- Nº de la Factura con más unidades vendidas (sacando todas las coincidentes) de las tiendas que
--contengan 'CRUZ' en la localidad.

--8.- Importe por Tipo de Componente, dando el nombre del tipo de componente y sacándolos todos.

--9.-Total de ventas (en importe) del mes de mayo

--10.- Tienda con la factura en la que se vendieron más artículos.

--11.- Tipos de componente no vendidos

--12.- Especificar las facturas con más de 2 artículos, indicando el nombre de la tienda.