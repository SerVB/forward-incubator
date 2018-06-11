В таблице аудита найти дату/время последней попытки продвижения заказа 2520123, закончившейся ошибкой. Результат: дата/время попытки в формате dd.mon.yyyy и номер заказа.

```sql
select to_char(tmp.DT_LAST_TRY, 'dd.mon.yyyy') V_LAST_TRY, '2520123' ID_ORDER
    from (
        select max(fpl.DT_TIMESTAMP) DT_LAST_TRY
            from fw_process_log fpl
        where instr(lower(fpl.V_MESSAGE), 'заказ 2520123') <> 0
            and fpl.ID_ERROR_CODE <> 0
    ) tmp;
```
