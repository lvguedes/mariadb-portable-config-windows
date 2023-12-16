# MariaDB portable (zip, no privileges) installation guide

## Summary

1. `mysql_install_db --datadir=C:\path\to\db --password=rootpwd123`
2. `Start-Process -FilePath 'C:\Windows\System32\cmd.exe' -ArgumentList '/c mysqld --defaults-file=path\to\db\my.ini --console'`
3. `mysql --user=root --password=rootpwd123`

## Create the database

To install MariaDB you first need to set the database

``` powershell
PS> C:\Users\lsilva46\Downloads\mariadb-10.7.3-winx64\bin\mysql_install_db.exe --datadir=C:\lucas\db --password=123
```

The `datadir` is the root dir of the database, and password with no
user implies root user's password.

## Start the Daemon (Server)

Then you start the daemon in a new CMD prompt:

``` powershell
PS> Start-Process -FilePath "C:\Windows\System32\cmd.exe" `
	              -ArgumentList "/c C:\Users\lsilva46\Downloads\mariadb-10.7.3-winx64\bin\mysqld.exe --defaults-file=C:\lucas\db\my.ini --console"
```

As you started the daemon in another prompt, namely a CMD prompt, you
have your terminal free to enter the next command.

With the daemon running, you can send SQL commands to it.

## Run the client (if needed)

Now, if you need to interact with the DBMS, you must start the client with:

``` powershell
PS> C:\Users\lsilva46\Downloads\mariadb-10.7.3-winx64\bin\mysql.exe --user=root --password=123
```
