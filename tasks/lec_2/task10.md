Найти те контракты, у которых менялась валюта. Результат: код контракта, лицевой счет, статус, наименование валюты. Данные вывести на текущий день.

```sql
select lhs.ID_CONTRACT as ID_CONTRACT, fc.V_EXT_IDENT as V_EXT_IDENT,
fc.V_STATUS as V_STATUS, fcur.V_NAME as V_CURRENCY_NAME
    from (select tmp.ID_CONTRACT as ID_CONTRACT, count(tmp.ID_CURRENCY) as N_CURRENCY_COUNT
        from (select distinct fc.ID_CONTRACT_INST as ID_CONTRACT, fc.ID_CURRENCY as ID_CURRENCY
            from fw_contracts /*as*/ fc) /*as*/ tmp
    group by tmp.ID_CONTRACT
    having count(tmp.ID_CURRENCY) > 1) /*as*/ lhs
left join fw_contracts /*as*/ fc
    on lhs.ID_CONTRACT = fc.ID_CONTRACT_INST
left join fw_currency /*as*/ fcur
    on fc.ID_CURRENCY = fcur.ID_CURRENCY
where fc.DT_START <= current_timestamp and current_timestamp < fc.DT_STOP;
```
