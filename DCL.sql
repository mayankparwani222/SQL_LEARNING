-- dcl
-- data control language
-- grant, revoke

create user 'ram' identified by 'ram';

--   ram % ipaddress
select * from mysql.user;

show grants for 'ram';  -- will show privileges

-- grant statement
grant all privileges on tushardb.* to 'ram';

-- revoke privileges statement
revoke all privileges on tushardb.* from 'ram';

-- roles
/*
A role is a collection of privileges (like SELECT, INSERT, UPDATE, etc.) that can be:
Granted to users
Revoked from users
Activated or deactivated for a session
*/
-- create a role
CREATE ROLE 'developer';
-- grant to a role
GRANT ALL PRIVILEGES ON tushardb.* TO 'developer';
-- how to add a user to role in mysql
GRANT 'developer' TO 'root'@'localhost';
