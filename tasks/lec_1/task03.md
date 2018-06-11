Найти все номера заказов в таблице аудита, с которых начиналась загрузка порции заказов. Результат: номера заказов.

```sql
select substr(fpl.V_MESSAGE, length('загрузка порции заказов начиная с ')) V_ORDER
    from fw_process_log fpl
where instr(lower(fpl.V_MESSAGE), 'загрузка порции заказов начиная с ') <> 0;
```
