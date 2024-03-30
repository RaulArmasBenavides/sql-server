-- Crear una cuenta de Database Mail
EXEC msdb.dbo.sysmail_add_account_sp
    @account_name = 'NombreCuentaCorreo',
    @email_address = 'tuCorreo@example.com',
    @mailserver_name = 'smtp.example.com'; -- Cambia esto por tu servidor SMTP

-- Crear un perfil de Database Mail
EXEC msdb.dbo.sysmail_add_profile_sp
    @profile_name = 'NombrePerfilCorreo',
    @description = 'Perfil de correo para envío de emails';

-- Asociar la cuenta al perfil
EXEC msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'NombrePerfilCorreo',
    @account_name = 'NombreCuentaCorreo',
    @sequence_number = 1;

EXEC msdb.dbo.sp_send_dbmail  
    @profile_name = 'Adventure Works Administrator',  
    @recipients = 'yourfriend@Adventure-Works.com',  
    @body = 'The stored procedure finished successfully.',  
    @subject = 'Automated Success Message' ;  