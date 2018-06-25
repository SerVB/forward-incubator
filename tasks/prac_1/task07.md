Вывести самую популярную и самую непопулярную услуги в рамках филиалах. Результат: филиал, самая популярная в филиале, самая непопулярная в филиале.

```sql
SELECT
    tmp_max.id_department AS id_department,
    tmp_max.id_max_service AS id_max_service,
    tmp_min.id_min_service AS id_min_service
FROM
    (
        SELECT
            tmp_count.id_department AS id_department,
            tmp_count.id_service AS id_max_service
        FROM
            (
                SELECT
                    tmp_count.id_department AS id_department,
                    MAX(tmp_count.n_unique_count) AS n_max_count
                FROM
                    (
                        SELECT
                            fd.id_department AS id_department,
                            fs.id_service AS id_service,
                            COUNT(DISTINCT fs.id_service_inst) AS n_unique_count
                        FROM
                            fw_services fs
                            JOIN fw_contracts fc ON fc.id_contract_inst = fs.id_contract_inst
                                                    AND fc.dt_start <= current_timestamp
                                                    AND fc.dt_stop > current_timestamp
                                                    AND fc.v_status = 'A'
                            JOIN fw_departments fd ON fd.id_department = fc.id_department
                                                      AND fd.b_deleted = 0
                        WHERE
                            fs.b_deleted = 0
                            AND fs.dt_start <= current_timestamp
                            AND fs.dt_stop > current_timestamp
                            AND fs.v_status = 'A'
                        GROUP BY
                            fd.id_department,
                            fs.id_service
                    ) tmp_count
                GROUP BY
                    tmp_count.id_department
            ) tmp_max_count
            JOIN (
                SELECT
                    fd.id_department AS id_department,
                    fs.id_service AS id_service,
                    COUNT(DISTINCT fs.id_service_inst) AS n_unique_count
                FROM
                    fw_services fs
                    JOIN fw_contracts fc ON fc.id_contract_inst = fs.id_contract_inst
                                            AND fc.dt_start <= current_timestamp
                                            AND fc.dt_stop > current_timestamp
                                            AND fc.v_status = 'A'
                    JOIN fw_departments fd ON fd.id_department = fc.id_department
                                              AND fd.b_deleted = 0
                WHERE
                    fs.b_deleted = 0
                    AND fs.dt_start <= current_timestamp
                    AND fs.dt_stop > current_timestamp
                    AND fs.v_status = 'A'
                GROUP BY
                    fd.id_department,
                    fs.id_service
            ) tmp_count ON tmp_count.id_department = tmp_max_count.id_department
                           AND tmp_count.n_unique_count = tmp_max_count.n_max_count
    ) tmp_max
    JOIN (
        SELECT
            tmp_count.id_department AS id_department,
            tmp_count.id_service AS id_min_service
        FROM
            (
                SELECT
                    tmp_count.id_department AS id_department,
                    MIN(tmp_count.n_unique_count) AS n_min_count
                FROM
                    (
                        SELECT
                            fd.id_department AS id_department,
                            fs.id_service AS id_service,
                            COUNT(DISTINCT fs.id_service_inst) AS n_unique_count
                        FROM
                            fw_services fs
                            JOIN fw_contracts fc ON fc.id_contract_inst = fs.id_contract_inst
                                                    AND fc.dt_start <= current_timestamp
                                                    AND fc.dt_stop > current_timestamp
                                                    AND fc.v_status = 'A'
                            JOIN fw_departments fd ON fd.id_department = fc.id_department
                                                      AND fd.b_deleted = 0
                        WHERE
                            fs.b_deleted = 0
                            AND fs.dt_start <= current_timestamp
                            AND fs.dt_stop > current_timestamp
                            AND fs.v_status = 'A'
                        GROUP BY
                            fd.id_department,
                            fs.id_service
                    ) tmp_count
                GROUP BY
                    tmp_count.id_department
            ) tmp_min_count
            JOIN (
                SELECT
                    fd.id_department AS id_department,
                    fs.id_service AS id_service,
                    COUNT(DISTINCT fs.id_service_inst) AS n_unique_count
                FROM
                    fw_services fs
                    JOIN fw_contracts fc ON fc.id_contract_inst = fs.id_contract_inst
                                            AND fc.dt_start <= current_timestamp
                                            AND fc.dt_stop > current_timestamp
                                            AND fc.v_status = 'A'
                    JOIN fw_departments fd ON fd.id_department = fc.id_department
                                              AND fd.b_deleted = 0
                WHERE
                    fs.b_deleted = 0
                    AND fs.dt_start <= current_timestamp
                    AND fs.dt_stop > current_timestamp
                    AND fs.v_status = 'A'
                GROUP BY
                    fd.id_department,
                    fs.id_service
            ) tmp_count ON tmp_count.id_department = tmp_min_count.id_department
                           AND tmp_count.n_unique_count = tmp_min_count.n_min_count
    ) tmp_min ON tmp_min.id_department = tmp_max.id_department;
```
