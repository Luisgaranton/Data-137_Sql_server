
select v.victima_rango_etario, v.edad_victima from victima v where v.victima_rango_etario= '10 a 19 años';
 --where llamante_descripcion like 'Comisa%';
--Otra instituci�n
update llamada set llamada_derivacion='No había moviles y/o Equipos para realizar la intervencion' where llamada_derivacion like 'No hab%';

update victima set victima_rango_etario= '80 a 89 años' where edad_victima between 80 and 89;