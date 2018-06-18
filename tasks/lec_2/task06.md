Найти такие контракты, на которых есть хотя бы один платеж в 2017 году. Результат: Номер лицевого счета, статус контракта, департамент контракта (если департамент не указан, то показать NULL).

```sql
select fc.V_EXT_IDENT as V_EXT_IDENT, fc.V_STATUS as V_CONTRACT_STATUS, fd.V_NAME as V_DEPT_NAME
    from fw_contracts /*as*/ fc
left join trans_external /*as*/ te
    on fc.ID_CONTRACT_INST = te.ID_CONTRACT
left join fw_departments /*as*/ fd
    on fc.ID_DEPARTMENT= fd.ID_DEPARTMENT
where to_char(fc.DT_REG_EVENT, 'yyyy') = '2017';
```
