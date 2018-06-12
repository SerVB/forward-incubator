По таблице переводов найти минимальную сумму перевода с датой поступления в систему в интервале 10:00-12:00 14 февраля 2017 при условии, что перевод должен был проходить между разными контрактами. Результат: единственное число - сумма перевода.

```sql
select min(ft.N_SUM) N_MIN_SUM
    from fw_transfers ft
where ft.ID_CONTRACT_FROM <> ft.ID_CONTRACT_TO and
    to_date('10:00 14.02.2017', 'hh24:mi dd.mm.yyyy') <= ft.DT_INCOMING and
    ft.DT_INCOMING < to_date('12:00 14.02.2017', 'hh24:mi dd.mm.yyyy');
```
