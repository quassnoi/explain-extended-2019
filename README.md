# explain-extended-2019
Explain Extended New Year 2019 post: a GIF decoder in PostgreSQL.

https://explainextended.com/2018/12/31/happy-new-year-10/

How to run it:

1. Download a GIF file
1. In bash shell, run:

    ```
    cat sample.gif | od -A n -vt x1 | tr -d '\n ' | psql -f pre.sql -c "COPY input FROM stdin" -f gif.sql
    ```

    This assumes you have `psql` credentials set up for your database, refer to [psql manual](https://www.postgresql.org/docs/11/app-psql.html) if you don't.
    
    If you don't have access to `psql`, hex-encode you gif file and insert it in the temporary table manually:
    
    ```
    CREATE TEMPORARY TABLE
            input
            (
            data TEXT
            );
        
    INSERT
    INTO    input
    VALUES  ('<hex data here>');
    ```

    then run `gif.sql` in the same database session;

    This script does not create any new objects in the database and does require any write permissions.
    
    Requires PostgreSQL 9.3 or higher.
        
1. Enjoy the rendered GIF:

```
 string_agg
------------
 .....
 .....
 .....
 ...####
 ...####
    ####...
    ####...
      .....
      .....
      .....
```

This is an excercise in SQL and does not render each and every GIF file. It does not work with animated GIF and those with transparency. If you open your file in `mspaint.exe` and save it as a GIF, it will probably work.

Large files might take a while to decode and render, be patient.

Happy New Year!
