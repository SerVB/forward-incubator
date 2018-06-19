Найти услуги всех абонентов, чья суммарная абон.плата больше средней суммарная абон.платы по филиалу. Результат: название услуги, филиал, величина сумм АП за услугу внутри филиала.

```sql
select fs.V_NAME as V_SERVICE_NAME, tmp_sum.ID_DEPARTMENT as ID_DEPARTMENT, sum(tmp_sum.N_TOTAL_COST) as N_TOTAL_SERVICE_COST
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
    on tmp_sum.ID_DEPARTMENT = rhs.ID_DEPARTMENT and tmp_sum.N_TOTAL_COST > rhs.F_AVG_COST
join fw_services /*as*/ fss
    on fss.DT_START <= current_timestamp and current_timestamp < fss.DT_STOP and fss.B_DELETED = 0 and fss.V_STATUS = 'A' and
        tmp_sum.ID_CONTRACT = fss.ID_CONTRACT_INST
join fw_service /*as*/ fs
    on fs.B_DELETED = 0 and
        fss.ID_SERVICE = fs.ID_SERVICE
group by fs.V_NAME, tmp_sum.ID_DEPARTMENT;
```
