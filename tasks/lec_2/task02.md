Создать отчет по департаментам контрактов. Выводить только те контракты, которые активны на текущий момент. Результат: номер лицевого счета, дату регистрации контракта, наименование департамента (если у контракта не указан департамент, то выводить null).

```sql
select fc.V_EXT_IDENT as V_EXT_IDENT, fc.DT_REG_EVENT as DT_REG_EVENT, fd.V_NAME as V_DEPT_NAME
    from fw_contracts /*as*/ fc
left join fw_departments /*as*/ fd
    on fc.ID_DEPARTMENT = fd.ID_DEPARTMENT
where fc.V_STATUS = 'A';
```
