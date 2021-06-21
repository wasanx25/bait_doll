# Find table from sql

Execute `cd /path/to` and navigate to the directory you want to find tables from sql files

```sh
find . -name "*.sql" | xargs -IXXX ./main.py XXX | sort | uniq
```
