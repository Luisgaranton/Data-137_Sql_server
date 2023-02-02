create procedure cantidad_casos_tipo_violencia_fecha
@fecha int=1,
@tipo  int=1

as

select count (c.ID) 'Cantidad de victimas', g.nombre_genero 'Genero', DATENAME(MONTH, ll.fecha) Mes, vt.nombre_violencia 'Tipo de Violencia' from casos c 
JOIN victima v on v.ID=victima_id 
JOIN violencia_tipo vt on v.violenciatipo_id = vt.ID
JOIN genero g on g.ID = v.id_genero 
JOIN llamada ll on ll.ID=c.llamada_id
where v.violenciatipo_id = @tipo and DATEPART(MONTH, ll.fecha)=@fecha
GROUP BY g.nombre_genero, DATENAME(MONTH, ll.fecha), vt.nombre_violencia;