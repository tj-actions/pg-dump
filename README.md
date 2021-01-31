[pg-dump](https://www.postgresql.org/docs/9.6/app-pgdump.html)
---------

Run [pg_dump](https://www.postgresql.org/docs/9.6/app-pgdump.html) to generate a backup

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Postgres Dump Backup
        uses: tj-actions/pg-dump@v1
        with:
          database_url: "postgres://test_user:test_user_password@localhost:5432/testdb"
          path: "backups/backup.sql" 
          options: "-O"   
```

> NOTE: Ensure the backup output file already exists.

Example
```yaml
    steps:
      - uses: actions/checkout@v2
      - name: Create backup file
        run: |
          touch backups/backup.sql
      - name: Postgres Dump Backup
        uses: tj-actions/pg-dump@v1
        with:
          database_url: "postgres://test_user:test_user_password@localhost:5432/testdb"
          path: "backups/backup.sql" 
          options: "-O"   

```


## Inputs

|   Input       |    type    |  required     |  default                      |  description  |
|:-------------:|:-----------:|:-------------:|:----------------------------:|:-------------:|
| database_url  |  `string`   |    `true`    |                              |  Database URL  |
| path          |  `string`   |    `true`    |                              |  Backup file output location  |
| options       |  `string`   |    `true`    |      `-O`                    |  Extra [options](https://www.postgresql.org/docs/9.6/app-pgdump.html#PG-DUMP-OPTIONS) passed to pg_dump  |



* Free software: [MIT license](LICENSE)


Credits
-------

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).



Report Bugs
-----------

Report bugs at https://github.com/tj-actions/pg-dump/issues.

If you are reporting a bug, please include:

* Your operating system name and version.
* Any details about your workflow that might be helpful in troubleshooting.
* Detailed steps to reproduce the bug.
