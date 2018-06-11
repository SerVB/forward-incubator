Сколько было завершённых процессов продвижения заказов в таблице аудита в марте 2018. Результат: единственное число - количество завершённых процессов.

```sql
select count(*) N_MARCH_COUNT
    from fw_process_log fpl
where instr(lower(fpl.V_MESSAGE), 'процесс продвижения заказов завершен') <> 0 and
    to_date('01.03.2018', 'dd.mm.yyyy') <= fpl.DT_TIMESTAMP and
    fpl.DT_TIMESTAMP < to_date('01.04.2018', 'dd.mm.yyyy');
```
