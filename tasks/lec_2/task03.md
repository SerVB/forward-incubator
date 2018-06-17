Найти департаменты, к которым привязано менее 2 контрактов. Результат: наименования департаментов.

```sql
select tmp.V_NAME
    from (select fd.V_NAME as V_NAME, count(*) as N_CONTRACT_COUNT
            from fw_departments /*as*/ fd
        left join fw_contracts /*as*/ fc
            on fd.ID_DEPARTMENT = fc.ID_DEPARTMENT
        group by fd.V_NAME) /*as*/ tmp
where tmp.N_CONTRACT_COUNT < 2;
```
