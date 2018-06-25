Вывести названия ТП из топ-5 по величине АП на последний день прошедшего месяца. Результат: филиал, ТП, суммарная величина АП по ТП в филиале.

```sql
SELECT
    *
FROM
    (
        SELECT
            fd.id_department AS id_department,
            ftp.id_tariff_plan AS id_tariff_plan,
            SUM(fsc.n_cost_period) AS n_total_cost
        FROM
            fw_service fs
            JOIN fw_services fss ON fss.id_service = fs.id_service
                                    AND fss.b_deleted = 0
                                    AND fss.dt_start <= trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
                                    AND fss.dt_stop > trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
                                    AND fss.v_status = 'A'
            JOIN fw_contracts fc ON fc.id_contract_inst = fss.id_contract_inst
                                    AND fc.v_status = 'A'
                                    AND fc.dt_start <= trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
                                    AND fc.dt_stop > trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
            JOIN fw_departments fd ON fd.id_department = fc.id_department
                                      AND fd.b_deleted = 0
            JOIN fw_services_cost fsc ON fsc.id_service_inst = fss.id_service_inst
                                         AND fsc.dt_start <= trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
                                         AND fsc.dt_stop > trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
            JOIN fw_tariff_plan ftp ON ftp.id_tariff_plan = fss.id_tariff_plan
                                       AND ftp.b_deleted = 0
                                       AND ftp.dt_start <= trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
                                       AND ftp.dt_stop > trunc(current_timestamp,'MONTH') - INTERVAL '1' DAY
        WHERE
            fs.b_deleted = 0
        GROUP BY
            fd.id_department,
            ftp.id_tariff_plan
        ORDER BY
            SUM(fsc.n_cost_period) DESC
    )
WHERE
    ROWNUM <= 5;
```
