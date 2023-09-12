[![Codacy Badge](https://api.codacy.com/project/badge/Grade/080ce8bd365042b9aecc57ef56cf69ff)](https://app.codacy.com/gh/tj-actions/pg-dump?utm_source=github.com\&utm_medium=referral\&utm_content=tj-actions/pg-dump\&utm_campaign=Badge_Grade_Settings)
[![CI](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml) [![Update release version.](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml) [![Public workflows that use this action.](https://img.shields.io/endpoint?url=https%3A%2F%2Fused-by.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fpg-dump%26badge%3Dtrue)](https://github.com/search?o=desc\&q=tj-actions+pg-dump+path%3A.github%2Fworkflows+language%3AYAML\&s=\&type=Code)

## pg-dump

Run [pg\_dump](https://www.postgresql.org/docs/9.6/app-pgdump.html) to generate a backup

## Usage

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Postgres Dump Backup
        uses: tj-actions/pg-dump@v2.3
        with:
          database_url: "postgres://test_user:test_user_password@localhost:5432/testdb"
          path: "backups/backup.sql" 
          options: "-O"   
```

If you feel generous and want to show some extra appreciation:

Support this project with a :star:

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee]: https://www.buymeacoffee.com/jackton1

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

|                                         INPUT                                          |  TYPE  | REQUIRED | DEFAULT |                                                DESCRIPTION                                                 |
|----------------------------------------------------------------------------------------|--------|----------|---------|------------------------------------------------------------------------------------------------------------|
|          <a name="input_database_url"></a>[database\_url](#input_database_url)          | string |   true   |         |                                                Database URL                                                |
|                 <a name="input_options"></a>[options](#input_options)                  | string |   true   | `"-O"`  | Extra [options](https://www.postgresql.org/docs/current/app-pgdump.html#PG-DUMP-OPTIONS) passed to pg\_dump |
|                      <a name="input_path"></a>[path](#input_path)                      | string |   true   |         |                                        Backup file output location                                         |
| <a name="input_postgresql_version"></a>[postgresql\_version](#input_postgresql_version) | string |  false   |         |                                       Version of PostgreSQL. e.g 15                                        |

<!-- AUTO-DOC-INPUT:END -->

*   Free software: [MIT license](LICENSE)

## Credits

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).

## Report Bugs

Report bugs at https://github.com/tj-actions/pg-dump/issues.

If you are reporting a bug, please include:

*   Your operating system name and version.
*   Any details about your workflow that might be helpful in troubleshooting.
*   Detailed steps to reproduce the bug.
