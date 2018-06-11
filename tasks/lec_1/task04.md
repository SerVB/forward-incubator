Найти количество уникальных номеров заказов в таблице аудита, с которых начиналась загрузка порции заказов. Результат: единственное число - количество заказов.

```sql
select count(distinct substr(fpl.V_MESSAGE, length('загрузка порции заказов начиная с '))) N_UNIQUE_COUNT
    from fw_process_log fpl
where instr(lower(fpl.V_MESSAGE), 'загрузка порции заказов начиная с ') <> 0;
```
