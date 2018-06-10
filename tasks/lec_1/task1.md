В таблице аудита найти количество попыток продвижения заказа 2520123, закончившихся ошибкой. Результат: количество попыток.

```sql
select count(*) from fw_process_log fpl
  where instr(lower(fpl.V_MESSAGE), 'заказ 2520123') <> 0
    and fpl.ID_ERROR_CODE <> 0;
```
