Найти пользователя и последнюю дату его входа по таблице аудита для кода пользователя = 11136. Результат: дата/время и логин пользователя.

```sql
select max(fpl.DT_TIMESTAMP) DT_LAST_LOGIN
    from fw_process_log fpl
where instr(lower(fpl.V_MESSAGE), 'вошел в систему') <> 0 and
    fpl.ID_USER = 11136;
```
