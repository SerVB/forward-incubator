Найти такие департаменты, к которым не привязано ни одного контракта. Результат: наименование департаментов.

```sql
select tmp.V_DEPT_NAME as V_DEPT_NAME
    from (select fd.V_NAME as V_DEPT_NAME, count(fc.ID_CONTRACT_INST) as N_CONTRACT_COUNT
            from fw_departments /*as*/ fd
        left join fw_contracts /*as*/ fc
            on fd.ID_DEPARTMENT= fc.ID_DEPARTMENT
        group by fd.V_NAME) /*as*/ tmp
where N_CONTRACT_COUNT = 0;
```
