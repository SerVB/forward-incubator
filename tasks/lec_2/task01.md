Найти сумму последнего платежа на контракте с лицевым счетом 0102100000088207_MG1. Результат: сумма платежа, дата платежа.

```sql
select distinct te.F_SUM as F_SUM, te.DT_EVENT as DT_EVENT
    from trans_external /*as*/ te
inner join fw_contracts /*as*/ fc
    on te.ID_CONTRACT = fc.ID_CONTRACT_INST
where fc.V_EXT_IDENT = '0102100000088207_MG1' and
    te.DT_EVENT = (select max(te.DT_EVENT) as DT_MAX_EVENT
            from trans_external /*as*/ te
        inner join fw_contracts /*as*/ fc
            on te.ID_CONTRACT = fc.ID_CONTRACT_INST
        where fc.V_EXT_IDENT = '0102100000088207_MG1');
```
