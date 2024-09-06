USE GeoGebra_demo
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Inés Ibáñez Valle
-- Create date: 11/04/2023
-- Description:	Modifica el número de orden de 
-- registros para dejar libre el número de orden
-- pasado como argumento.
-- Parámetros:
--   @numOrden (INT) - El número de orden a 
-- partir del cual se debe incrementar el valor
-- de ORDEN para crear un hueco.
-- =============================================
CREATE PROCEDURE crea_hueco
	
	@numOrden AS INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	-- Incrementa el valor de ORDEN en 1 para todos los registros donde ORDEN >= @numOrden
	UPDATE RECURSOS SET ORDEN=ORDEN+1 WHERE ORDEN >= @numOrden;
END
GO
