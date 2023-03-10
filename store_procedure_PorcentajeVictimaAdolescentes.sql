USE [Data_137]
GO
/****** Object:  StoredProcedure [dbo].[PorcentajeVictimaAdolescentes]    Script Date: 12/22/2022 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PorcentajeVictimaAdolescentes]
AS
 DECLARE @totalVictimasAdolescentes INT
 DECLARE @totalCasos INT
 DECLARE @ResultadoPorcentaje FLOAT 
 SET @totalVictimasAdolescentes = (select COUNT(c.ID) cantidad 
 from casos c 
    join llamada ll 
	on ll.ID=c.llamada_id
	join victima v
	on v.ID=c.victima_id
 where datepart(YEAR, ll.fecha)='2022' and v.edad_victima between 12 and 17);

 SET @totalCasos = (select count(c.ID) from casos c);

 SET @ResultadoPorcentaje = (select @totalVictimasAdolescentes * 100 / @totalCasos);

 SELECT @ResultadoPorcentaje;


