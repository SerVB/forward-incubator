Вывести количество записей в таблице аудита по месяцам. Результат: название месяца и количество записей аудита в нём.

```sql
select to_char(fpl.DT_TIMESTAMP, 'month') V_MONTH, count(*) N_COUNT
    from fw_process_log fpl
group by to_char(fpl.DT_TIMESTAMP, 'month');
```
