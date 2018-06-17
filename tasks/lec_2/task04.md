Создать отчет по платежам за последний месяц в разрезе департаментов. Результат: наименование департамента, сумма платежей в этом департаменте за последний месяц, количество платежей в этом департаменте за последний месяц, количество контрактов в этом департаменте.

```sql
select cc.V_NAME as V_DEPT_NAME, st.F_TOTAL_SUM as F_TOTAL_SUM,
st.N_TRANS_COUNT as N_TRANS_COUNT, cc.N_CONTRACT_COUNT
    from (select fd.V_NAME as V_DEPT_NAME, sum(F_SUM) as F_TOTAL_SUM,
    count(ID_TRANS) as N_TRANS_COUNT
        from fw_departments /*as*/ fd
    left join fw_contracts /*as*/ fc
        on fd.ID_DEPARTMENT = fc.ID_DEPARTMENT
    left join trans_external /*as*/ te
        on fc.ID_CONTRACT_INST = te.ID_CONTRACT
    where fc.DT_REG_EVENT >= current_timestamp - interval '1' month
    group by fd.V_NAME) /*as*/ st
full outer join (select fd.V_NAME as V_NAME, count(*) as N_CONTRACT_COUNT
        from fw_departments /*as*/ fd
    left join fw_contracts /*as*/ fc
        on fd.ID_DEPARTMENT = fc.ID_DEPARTMENT
    group by fd.V_NAME) /*as*/ cc
on st.V_DEPT_NAME = cc.V_NAME;
```
