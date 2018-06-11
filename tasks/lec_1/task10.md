Сколько записей в таблице аудита со статусом сообщения = "Ошибка" для процесса с кодом = 5 в интервале 22.02.2018 - 02.03.2018 (не включая границы). Сколько среди них с уникальным текстом сообщения. Результат: два числа - общее количество записей по условиям и количество записей с уникальным сообщением.

```sql
select count(*) N_TOTAL, count(distinct fpl.V_MESSAGE) N_UNIQUE
    from fw_process_log fpl
where fpl.ID_PROCESS = 5 and fpl.ID_ERROR_CODE <> 0 and
    to_date('23.02.2018', 'dd.mm.yyyy') <= fpl.DT_TIMESTAMP and
    fpl.DT_TIMESTAMP < to_date('02.03.2018', 'dd.mm.yyyy');
```
