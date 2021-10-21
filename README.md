[![CI](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/test.yml) [![Update release version.](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/pg-dump/actions/workflows/sync-release-version.yml) [![Public workflows that use this action.](https://img.shields.io/endpoint?url=https%3A%2F%2Fapi-tj-actions1.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fpg-dump%26badge%3Dtrue)](https://github.com/search?o=desc\&q=tj-actions+pg-dump+path%3A.github%2Fworkflows+language%3AYAML\&s=\&type=Code)

## pg-dump

Run [pg\_dump](https://www.postgresql.org/docs/9.6/app-pgdump.html) to generate a backup

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

## Inputs

|   Input       |    type    |  required     |  default                      |  description  |
|:-------------:|:-----------:|:-------------:|:----------------------------:|:-------------:|
| database\_url  |  `string`   |    `true`    |                              |  Database URL  |
| path          |  `string`   |    `true`    |                              |  Backup file output location  |
| options       |  `string`   |    `true`    |      `-O`                    |  Extra [options](https://www.postgresql.org/docs/9.6/app-pgdump.html#PG-DUMP-OPTIONS) passed to pg\_dump  |

*   Free software: [MIT license](LICENSE)

If you feel generous and want to show some extra appreciation:

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee]: https://www.buymeacoffee.com/jackton1

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png

## Credits

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).

## Report Bugs

Report bugs at https://github.com/tj-actions/pg-dump/issues.

If you are reporting a bug, please include:

*   Your operating system name and version.
*   Any details about your workflow that might be helpful in troubleshooting.
*   Detailed steps to reproduce the bug.
