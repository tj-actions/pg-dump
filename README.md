[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge\&logo=ubuntu\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge\&logo=macos\&logoColor=F0F0F0)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge\&logo=windows\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Public workflows that use this action.](https://img.shields.io/endpoint?url=https%3A%2F%2Fused-by.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fpg-dump%26badge%3Dtrue&style=for-the-badge)](https://github.com/search?o=desc\&q=tj-actions+pg-dump+path%3A.github%2Fworkflows+language%3AYAML\&s=\&type=Code)


[![Codacy Badge](https://app.codacy.com/project/badge/Grade/3cc349580b7d45b6ae4c36ebd0811a1f)](https://app.codacy.com/gh/tj-actions/pg-dump/dashboard?utm_source=gh\&utm_medium=referral\&utm_content=\&utm_campaign=Badge_grade)
[![CI](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml) [![Update release version.](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml)

## pg-dump

Run [pg\_dump](https://www.postgresql.org/docs/9.6/app-pgdump.html) to generate a backup

## Usage

### Using the default PostgreSQL installed on the runner

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Postgres Dump Backup
        uses: tj-actions/pg-dump@v3
        with:
          database_url: "postgres://test_user:test_user_password@localhost:5432/testdb"
          path: "backups/backup.sql" 
          options: "-O"   
```

### Using a different PostgreSQL version

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Postgres Dump Backup
        uses: tj-actions/pg-dump@v3
        with:
          database_url: "postgres://test_user:test_user_password@localhost:5432/testdb"
          postgresql_version: "16"  # Note: Only the major version is required e.g. 12, 14, 15, 16
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

*   [install-postgresql](https://github.com/tj-actions/install-postgresql)

## Report Bugs

Report bugs at https://github.com/tj-actions/pg-dump/issues.

If you are reporting a bug, please include:

*   Your operating system name and version.
*   Any details about your workflow that might be helpful in troubleshooting.
*   Detailed steps to reproduce the bug.
