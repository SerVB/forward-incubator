Найти контракты, на которые в 2017 году было совершено более 3 платежей. Результат: номер лицевого счета, статус контракта, количество платежей на этом контракте за 2017 году.

*Не удалось сгруппировать по двум столбцам, поэтому пришлось делать лютый костыль, заключающийся в запихивании двух ячеек в одну.*

```sql
select substr(tmp.V_EXT_IDENT__CONTRACT_STATUS, 0, instr(tmp.V_EXT_IDENT__CONTRACT_STATUS, '--') - 1) as V_EXT_IDENT,
substr(tmp.V_EXT_IDENT__CONTRACT_STATUS, instr(tmp.V_EXT_IDENT__CONTRACT_STATUS, '--') + 2) as V_CONTRACT_STATUS,
tmp.N_TRANS_COUNT as N_TRANS_COUNT
    from (select fc.V_EXT_IDENT || '--' || fc.V_STATUS as V_EXT_IDENT__CONTRACT_STATUS, count(*) as N_TRANS_COUNT
            from fw_contracts /*as*/ fc
        left join trans_external /*as*/ te
            on fc.ID_CONTRACT_INST = te.ID_CONTRACT
        where to_char(fc.DT_REG_EVENT, 'yyyy') = '2017'
        group by fc.V_EXT_IDENT || '--' || fc.V_STATUS) /*as*/ tmp
where tmp.N_TRANS_COUNT > 3;
```
