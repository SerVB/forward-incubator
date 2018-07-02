```sql
/*
Реализовать с помощью цикла по курсору процедуру checkstatus.
Процедура должна для записей, у которых scd_equip_kits.id_dealer_client не null
но статус отличный от Продано(scd_equipment_status) проставить статус Продано.

Кроме того, вывести в dbms_output.put_line информацию в виде:

"Для оборудования scd_equip_kits.id_equip_kits_inst дилера
fw_clients.v_long_title с контрактом fw_contracts.v_ext_ident,
являющегося(если scd_contracts.b_agency = 1) или
не являющегося(если scd_contracts.b_agency = 0)
агентской сетью, был проставлен статус Продано."
*/
CREATE OR REPLACE PROCEDURE getequip IS

    CURSOR cur IS SELECT
        fcl.v_long_title,
        fc.v_ext_ident,
        sek.id_equip_kits_inst,
        ses.v_name,
        sc.b_agency
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
                                   AND sek.id_dealer_client IS NOT NULL
        JOIN scd_equipment_kits_type sekt ON sekt.id_equip_kits_type = sek.id_equip_kits_type
                                             AND sekt.dt_start <= current_timestamp
                                             AND sekt.dt_stop > current_timestamp
        JOIN scd_equipment_status ses ON ses.id_equipment_status = sek.id_status
                                         AND ses.b_deleted = 0
                                         AND ses.v_name != 'Продано'
        JOIN scd_contracts sc ON sc.id_contract_inst = fc.id_contract_inst
                  WHERE
        fcl.dt_start <= current_timestamp
        AND fcl.dt_stop > current_timestamp
    FOR UPDATE OF ses.v_name;

    v_long_title    fw_clients.v_long_title%TYPE;
    v_ext_ident     fw_contracts.v_ext_ident%TYPE;
    id_equip_kits   scd_equip_kits.id_equip_kits_inst%TYPE;
    v_status_name   scd_equipment_status.v_name%TYPE;
    b_agency        scd_contracts.b_agency%TYPE;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO
            v_long_title,
            v_ext_ident,
            id_equip_kits,
            v_status_name,
            b_agency;
        EXIT WHEN cur%notfound;
        UPDATE scd_equipment_status
        SET
            v_name = 'Продано'
        WHERE
            CURRENT OF cur;

        dbms_output.put_line('Для оборудования '
                               || id_equip_kits
                               || ' дилера '
                               || v_long_title
                               || ' с контрактом '
                               || v_ext_ident
                               || ', '
                               ||
            CASE(b_agency)
                WHEN 1 THEN 'являющегося'
                ELSE 'не являющегося'
            END
                               || ' агентской сетью, был проставлен статус Продано.');

    END LOOP;

    CLOSE cur;
END;
```
