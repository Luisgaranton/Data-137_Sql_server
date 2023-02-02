

 -- se usa para filtrar las llamadas hechas desde una fecha en especifica a otra, ademas la ordenamos ascendentemente y quitamos los segundos restantes a la hora.
 select ID, fecha, CONVERT(char(8), getdate(), 108) AS [hh:mm:ss], provincia, llamada_derivacion
 from llamada 
 where "fecha" between '2022-01-01' and '2022-01-07' order by "fecha" asc
;
 
 -- obtiene la cantida de casos reportados en la primera semana de cada mes. 
 select  ID,fecha,provincia, llamada_derivacion, COUNT(*) as cantidad from llamada
 where "fecha" between '2022-02-01' and '2022-02-07'
 group by ID,fecha,provincia, llamada_derivacion;

 select COUNT (*) as cantidad from casos
 join llamada
 on llamada.ID=llamada_id
 where "fecha" between '2022-02-01'and '2022-02-7';

 select * from genero;

 -- obtine los casos donde la relacion del agresor con la victima es el padre.
 select g.nombre_genero victima_genero, v.edad_victima, v.victima_cantidad, a.relacion_victima_agresor from casos c
 join victima v
 on v.ID=c.victima_id
 join  agresor a
 on a.ID=c.agresor_id
 join genero g
 on g.ID=v.id_genero
 where  a.relacion_victima_agresor='Padre'
 order by v.ID asc;


 select COUNT(c.ID) cantidad 
 from casos c 
	join llamada ll 
	on ll.ID=c.llamada_id
	join llamante te
	on te.ID=c.llamante_id
	join genero g
	on g.ID=te.id_genero
 where datepart(MONTH, ll.fecha)= '1' and g.ID='1';

select count(da.ID) cantidad from llamada da join llamante te on da.llamante_id = te.ID 
where te.id_genero = 1 and datepart(MONTH, da.fecha)= '1'

  

select ID from genero g where g.nombre_genero='Femenino';

 select * from victima 

 select COUNT(c.ID) cantidad 
 from casos c 
    join llamada ll 
	on ll.ID=c.llamada_id
	join victima v
	on v.ID=c.victima_id
 where datepart(YEAR, ll.fecha)='2022' and v.victima_rango_etario like '%12 a 17%';



--AVG(all v.edad_victima)  avg_all ,
--v.victima_rango_etario like '%12 a 17%';

select count(c.ID) from casos c
select * from victima
exec PorcentajeVictimaAdolescentes;
exec Porcentajeagresorm;

 select g.nombre_genero,v.edad_victima, a.relacion_victima_agresor, count(c.ID) cantidad 
 from casos c 
    join llamada ll 
	on ll.ID=c.llamada_id
	join victima v
	on v.ID=c.victima_id
	join genero g
	on g.ID=v.id_genero
	join agresor a
	on a.ID=c.agresor_id
where  v.edad_victima between 12 and 17
group by g.nombre_genero, v.edad_victima, a.relacion_victima_agresor;


select * from agresor a order by a.id_genero