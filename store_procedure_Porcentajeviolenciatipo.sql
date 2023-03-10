USE [Data_137]
GO
/****** Object:  StoredProcedure [dbo].[Porcentajeviolenciatipo]    Script Date: 12/27/2022 1:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[Porcentajeviolenciatipo]
@tipo int= 1
 AS
 DECLARE @totalvictimas INT
 DECLARE @totalcasos INT
 DECLARE @resultadoporcentaje FLOAT (3)
 declare @nombretipo nvarchar (50)
 
 SET @totalvictimas =(SELECT COUNT(c.ID) cantidad FROM casos c join victima v ON v.ID=victima_id JOIN violencia_tipo vt ON vt.ID=v.violenciatipo_id WHERE vt.ID=@tipo);
 
 SET @totalcasos =(SELECT count(c.ID) from casos c);

 SET @resultadoporcentaje = (select @totalvictimas * 100 / @totalcasos);

 SET @nombretipo = (select vt.nombre_violencia from violencia_tipo vt where vt.ID=@tipo);

 SELECT @nombretipo violencia , CONCAT(@resultadoporcentaje, '%') Porcentaje_violencia_tipo;

 execute Porcentajeviolenciatipo 1;
execute Porcentajeviolenciatipo 2;
execute Porcentajeviolenciatipo 3;
execute Porcentajeviolenciatipo 4;
execute Porcentajeviolenciatipo 5;
execute Porcentajeviolenciatipo 6;
execute Porcentajeviolenciatipo 7;
execute Porcentajeviolenciatipo 8;
execute Porcentajeviolenciatipo 9;