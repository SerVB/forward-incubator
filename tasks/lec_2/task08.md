Вывести количество платежей на контрактах. Результат: количество платежей, дата последнего платежа, номер лицевого счета контракта, имя пользователя, создавшего платеж.

```sql
select lhs.ID_CONTRACT as ID_CONTRACT, lhs.N_TRANS_COUNT as N_TRANS_COUNT,
rhs.DT_LAST_EVENT as DT_LAST_EVENT, rhs.V_EXT_IDENT as V_EXT_IDENT, rhs.ID_MANAGER as ID_MANAGER
    from (select fc.ID_CONTRACT_INST as ID_CONTRACT, count(te.ID_TRANS) as N_TRANS_COUNT
            from fw_contracts /*as*/ fc
        left join trans_external /*as*/ te
            on fc.ID_CONTRACT_INST = te.ID_CONTRACT
        group by fc.ID_CONTRACT_INST) /*as*/ lhs
left join (select distinct fc.ID_CONTRACT_INST as ID_CONTRACT, te.DT_EVENT as DT_LAST_EVENT,
        fc.V_EXT_IDENT as V_EXT_IDENT, te.ID_MANAGER as ID_MANAGER
            from fw_contracts /*as*/ fc
        left join trans_external /*as*/ te
            on fc.ID_CONTRACT_INST = te.ID_CONTRACT
        left join (select fc.ID_CONTRACT_INST as ID_CONTRACT, max(te.DT_EVENT) as DT_LAST_EVENT
                    from fw_contracts /*as*/ fc
                left join trans_external /*as*/ te
                    on fc.ID_CONTRACT_INST = te.ID_CONTRACT
                group by fc.ID_CONTRACT_INST) /*as*/ last_evt
            on fc.ID_CONTRACT_INST = last_evt.ID_CONTRACT
        where te.DT_EVENT = last_evt.DT_LAST_EVENT) /*as*/ rhs
    on lhs.ID_CONTRACT = rhs.ID_CONTRACT;
```
