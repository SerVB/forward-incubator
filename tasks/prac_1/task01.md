Найти всех абонентов, чья суммарная абон.плата больше средней суммарной абон.платы по филиалу. Результат: номер договора и величина АП.

```sql
select tmp_sum.ID_CONTRACT as ID_CONTRACT, tmp_sum.N_TOTAL_COST as N_TOTAL_COST
    from (select fc.ID_CONTRACT_INST as ID_CONTRACT, fc.ID_DEPARTMENT as ID_DEPARTMENT, sum(fsc.N_COST_PERIOD) as N_TOTAL_COST
            from fw_contracts /*as*/ fc
        join fw_services_cost /*as*/ fsc
            on fc.ID_CONTRACT_INST = fsc.ID_CONTRACT_INST and
                fsc.DT_START <= current_timestamp and current_timestamp < fsc.DT_STOP
        where fc.DT_START <= current_timestamp and current_timestamp < fc.DT_STOP and fc.V_STATUS = 'A'
        group by fc.ID_CONTRACT_INST, fc.ID_DEPARTMENT) /*as*/ tmp_sum
join (select tmp_sum.ID_DEPARTMENT as ID_DEPARTMENT, avg(tmp_sum.N_TOTAL_COST) as F_AVG_COST
            from (select fc.ID_CONTRACT_INST as ID_CONTRACT, fc.ID_DEPARTMENT as ID_DEPARTMENT, sum(fsc.N_COST_PERIOD) as N_TOTAL_COST
                    from fw_contracts /*as*/ fc
                join fw_services_cost /*as*/ fsc
                    on fc.ID_CONTRACT_INST = fsc.ID_CONTRACT_INST and
                        fsc.DT_START <= current_timestamp and current_timestamp < fsc.DT_STOP
                where fc.DT_START <= current_timestamp and current_timestamp < fc.DT_STOP and fc.V_STATUS = 'A'
                group by fc.ID_CONTRACT_INST, fc.ID_DEPARTMENT) /*as*/ tmp_sum
        group by tmp_sum.ID_DEPARTMENT) /*as*/ rhs
    on tmp_sum.ID_DEPARTMENT = rhs.ID_DEPARTMENT and tmp_sum.N_TOTAL_COST > rhs.F_AVG_COST;
```
