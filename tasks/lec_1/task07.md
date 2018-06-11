Сколько повторяющихся идентификаторов сессии есть в таблице аудита. Результат: единственное число - количество повторяющихся идентификаторов.

```sql
select count(*) N_COUNT from (
    select fpl.SID ID_SESSION, count(*) N_COUNT
        from fw_process_log fpl
    group by fpl.SID
) where N_COUNT > 1;
```
