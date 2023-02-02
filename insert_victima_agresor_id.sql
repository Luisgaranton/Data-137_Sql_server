select * from casos

alter table llamada add llamante_id int NULL;

alter table victi
 add constraint fk_victima_agresor
  foreign key (agresor_id)
   references agresor ("id");

--insert into victima("agresor_id") select id from agresor 
update victima set agresor_id = agresor.ID from agresor where victima.ID = agresor.ID 
update llamada set llamante_id = llamante.ID from llamante where llamada.ID = llamante.ID
update victima set fecha
select * from victima
select * from llamada
--where id_genero = null

Select * from llamada order by fecha ASC
update calendario set fecha = ll.fecha from llamada ll where ll.ID = calendario.ID
update victima set fecha = ll.fecha from llamada ll where ll.ID = victima.ID
select * from casos
drop table calendario 

EXEC sp_RENAME 'calendario.column3', 'año', 'COLUMN'

ALTER TABLE [calendario] ADD ID INT IDENTITY(1,1);

alter table calendario add fecha date null;
alter table victima
drop column fecha;
select * from calendario 



