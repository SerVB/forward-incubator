Разбить услуги на наиболее прибыльные (1), средней прибыли (2) и малой прибыли (3) за текущий период. Результат: услуга, прибыль от услуги за период, результат разбиения.

```sql
SELECT
    id_service,
    n_total_cost_period,
    NTILE(3) OVER(
        ORDER BY
            n_total_cost_period DESC
    ) AS n_profit_level
FROM
    (
        SELECT
            fs.id_service AS id_service,
            SUM(fsc.n_cost_period) AS n_total_cost_period
        FROM
            fw_services fs
            JOIN fw_contracts fc ON fc.id_contract_inst = fs.id_contract_inst
                                    AND fc.dt_start <= current_timestamp
                                    AND fc.dt_stop > current_timestamp
                                    AND fc.v_status = 'A'
            JOIN fw_services_cost fsc ON fsc.id_contract_inst = fc.id_contract_inst
                                         AND fsc.dt_start <= current_timestamp
                                         AND fsc.dt_stop > current_timestamp
        WHERE
            fs.b_deleted = 0
            AND fs.dt_start <= current_timestamp
            AND fs.dt_stop > current_timestamp
            AND fs.v_status = 'A'
        GROUP BY
            fs.id_service
    );
```
