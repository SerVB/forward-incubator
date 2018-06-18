Какой был лицевой счет первого января 2016 у контракта, на который совершили платеж ID_TRANS = 6397542. Результат: номер лицевого счета.

``sql
select fc.V_EXT_IDENT as V_EXT_IDENT
    from fw_contracts /*as*/ fc
left join trans_external /*as*/ te
    on fc.ID_CONTRACT_INST = te.ID_CONTRACT
where fc.DT_START <= to_date('01.01.2016', 'dd.mm.yyyy') and
    to_date('01.01.2016', 'dd.mm.yyyy') < fc.DT_STOP and
    te.ID_TRANS = 6397542;
```
