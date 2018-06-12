Предоставить срез количества денежных переводов внутри контракта (контракт с которого = контракт на который) по дням. Результат: день в формате dd.mm.yyyy и количество переводов в этот день.

```sql
select to_char(ft.DT_REAL, 'dd.mm.yyyy') V_DAY, count(*) N_TRANSFER_COUNT
    from fw_transfers ft
where ft.ID_CONTRACT_FROM = ft.ID_CONTRACT_TO
group by to_char(ft.DT_REAL, 'dd.mm.yyyy');
```
