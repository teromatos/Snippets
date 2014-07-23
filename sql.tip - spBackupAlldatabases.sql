USE [master]
GO
/****** Object:  StoredProcedure [dbo].[spBackupAlldatabases]    Script Date: 01/09/2009 16:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[spBackupAlldatabases] 
as 

declare cur_databases cursor for 
select name from master..sysdatabases where name not in ('tempdb') 

open cur_databases 

declare @spath varchar(100), @sDBName varchar(100), @sBackupPath varchar(100), @cleardbs varchar(100) 
set @sPath = 'C:\BACKUP\database\' 

-- Clear out backups in this folder 
-- Uncomment if you like (clears out databases that have since been removed) 
-- However this may defeat the purpose of this script, since the creation dates will have changed on all files 
-- set @cleardbs = 'del "' + @sPath + '*.bak"' 
-- exec master..xp_cmdshell @cleardbs 

fetch next  from cur_databases into @sDBName 

While (@@fetch_status = 0) 
BEGIN 
   set @sBackupPath = @sPath + @sDBName + '.bak' 
   backup database @sDBName to disk = @sBackupPath with init 
   fetch next  from cur_databases into @sDBName 
END 

close cur_databases 
deallocate cur_databases 
