Вывести названия услуг из топ-5 по величине АП на текущий момент. Результат: название услуги, филиал, тип услуги, суммарная величина АП по услуге в филиале.

```sql
SELECT
    *
FROM
    (
        SELECT
            fs.v_name AS v_name,
            fd.id_department AS id_department,
            fs.id_service AS id_service,
            SUM(fsc.n_cost_period) AS n_total_cost
        FROM
            fw_service fs
            JOIN fw_services fss ON fss.id_service = fs.id_service
                                    AND fss.b_deleted = 0
                                    AND fss.dt_start <= current_timestamp
                                    AND fss.dt_stop > current_timestamp
            JOIN fw_contracts fc ON fc.id_contract_inst = fss.id_contract_inst
                                    AND fc.v_status = 'A'
                                    AND fc.dt_start <= current_timestamp
                                    AND fc.dt_stop > current_timestamp
            JOIN fw_departments fd ON fd.id_department = fc.id_department
                                      AND fd.b_deleted = 0
            JOIN fw_services_cost fsc ON fsc.id_service_inst = fss.id_service_inst
                                         AND fsc.dt_start <= current_timestamp
                                         AND fsc.dt_stop > current_timestamp
        WHERE
            fs.b_deleted = 0
        GROUP BY
            fs.v_name,
            fs.id_service,
            fd.id_department
        ORDER BY
            SUM(fsc.n_cost_period) DESC
    )
WHERE
    ROWNUM <= 5;
```
