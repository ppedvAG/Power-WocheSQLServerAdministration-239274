--Kontaktliste

--nur Operatoren können innerhalb eines Auftrags als  Nachrichten gesendet bekommen

USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'SQLAdmins', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'andreasr@ppedv.de'
GO


exec msdb.dbo.sp_send_dbmail


select * from sys.databases where state_desc != 'ONLINE'


Alerts

select * from customers

select * from sys.messages 
where language_id=1031


Ebene bis16 




