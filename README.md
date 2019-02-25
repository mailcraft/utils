# MailCraft Utilities

## Backup data

```bash
docker run --rm -v $PWD:/var/backup mailcraft/utils rsync -av --delete /var/backup login@example.com:backup/
```