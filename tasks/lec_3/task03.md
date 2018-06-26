```sql
/*
Реализовать процедуру getEquip, принимающую на вход pID_EQUIP_KITS_INST default null и отдающую(out) sys_refcursor.
В процедуре с помощью конструкции OPEN...FOR реализовать наполнение курсора следующими данными:
Наименование клиента, логин клиента, идентификатор контракта, наименование комплекта,
номер декодера(использовать функцию getDecoder).

В случае, если pID_EQUIP_KITS_INST is null, тогда все имеющиеся данные,
иначе только строчку с данным pID_EQUIP_KITS_INST.

Каждому scd_equip_kits.id_equip_kits_inst соответствует одна строчка курсора.
*/
CREATE OR REPLACE PROCEDURE getequip (
    dwr                   OUT SYS_REFCURSOR,
    pid_equip_kits_inst   IN NUMBER DEFAULT NULL
)
    IS
BEGIN
    IF
        pid_equip_kits_inst IS NULL
    THEN
        OPEN dwr FOR SELECT
            fcl.v_long_title AS v_client_name,
            cu.v_username AS v_client_login,
            fc.id_contract_inst AS id_contract,
            sekt.v_name AS v_kit_name,
            getdecoder(sek.id_equip_kits_inst) AS n_decoder
                     FROM
            fw_clients fcl
            JOIN ci_users cu ON cu.id_client_inst = fcl.id_client_inst
                                AND cu.v_status = 'A'
            JOIN fw_contracts fc ON fc.id_client_inst = fcl.id_client_inst
                                    AND fc.dt_start <= current_timestamp
                                    AND fc.dt_stop > current_timestamp
                                    AND fc.v_status = 'A'
            JOIN scd_equip_kits sek ON sek.id_contract_inst = fc.id_contract_inst
                                       AND sek.dt_start <= current_timestamp
                                       AND sek.dt_stop > current_timestamp
            JOIN scd_equipment_kits_type sekt ON sekt.id_equip_kits_type = sek.id_equip_kits_type
                                                 AND sekt.dt_start <= current_timestamp
                                                 AND sekt.dt_stop > current_timestamp
                     WHERE
            fcl.dt_start <= current_timestamp
            AND fcl.dt_stop > current_timestamp;

    ELSE
        OPEN dwr FOR SELECT
            fcl.v_long_title AS v_client_name,
            cu.v_username AS v_client_login,
            fc.id_contract_inst AS id_contract,
            sekt.v_name AS v_kit_name,
            getdecoder(sek.id_equip_kits_inst) AS n_decoder
                     FROM
            fw_clients fcl
            JOIN ci_users cu ON cu.id_client_inst = fcl.id_client_inst
                                AND cu.v_status = 'A'
            JOIN fw_contracts fc ON fc.id_client_inst = fcl.id_client_inst
                                    AND fc.dt_start <= current_timestamp
                                    AND fc.dt_stop > current_timestamp
                                    AND fc.v_status = 'A'
            JOIN scd_equip_kits sek ON sek.id_contract_inst = fc.id_contract_inst
                                       AND sek.dt_start <= current_timestamp
                                       AND sek.dt_stop > current_timestamp
            JOIN scd_equipment_kits_type sekt ON sekt.id_equip_kits_type = sek.id_equip_kits_type
                                                 AND sekt.dt_start <= current_timestamp
                                                 AND sekt.dt_stop > current_timestamp
                                                 AND sek.id_equip_kits_inst = pid_equip_kits_inst  /* <-- */
                     WHERE
            fcl.dt_start <= current_timestamp
            AND fcl.dt_stop > current_timestamp;

    END IF;
END;
```
