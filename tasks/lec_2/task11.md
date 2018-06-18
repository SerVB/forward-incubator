Найти контракты, у которых есть несколько записей со статусом "Расторгнут". Результат: код контракта.

```sql
select tmp.ID_CONTRACT as ID_CONTRACT
    from (select fc.ID_CONTRACT_INST as ID_CONTRACT, fc.V_STATUS as V_STATUS
            from fw_contracts /*as*/ fc
        where lower(fc.V_STATUS) = 'c') /*as*/ tmp
group by tmp.ID_CONTRACT
having count(tmp.V_STATUS) > 1;
```
