--Audit = Überwachung

--1. Audit Datei aktivieren --> Sicherheit
--2. Serverüberwachung --> Aktion auswählen und Auditdatei aus 1. angeben
--3. DB Überwachung --> Auditdatei angeben--> Aktion auswählen

--Leider klappt das Anzeigen im SSMS aktuell nicht
--aber mit dem hier schon.. Filter mit where

select * from sys.fn_get_audit_file 
	('c:\_SQLBACKUP\Security_DF7F3D53-DE58-4316-845D-05DAFE428884_0_133602346247870000.sqlaudit', default, default) 

where server_principal_name ='SUSI'