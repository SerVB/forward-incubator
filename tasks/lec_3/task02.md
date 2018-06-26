```sql
/*
Реализовать функцию getDecoder, принимающую на вход id_equip_kits_inst.
В случае, если в scd_equip_kits у актуальной записи проставлен контракт,
у которого в scd_contracts проставлен признак b_agency = 1,
тогда вернуть scd_equip_kits.v_cas_id,
иначе scd_equip_kits.v_ext_ident.

Если оборудование не найдено, то выдать ошибку "Оборудование не найдено".
*/
CREATE OR REPLACE FUNCTION getdecoder (
    id_equip_kits_inst IN NUMBER
) RETURN VARCHAR2 IS
    equip_count   NUMBER;
    ans           VARCHAR2(100);
BEGIN
    SELECT
        COUNT(*)
    INTO equip_count
    FROM
        scd_equip_kits sek
    WHERE
        sek.id_equip_kits_inst = id_equip_kits_inst
        AND sek.dt_start <= current_timestamp
        AND sek.dt_stop > current_timestamp;

    IF
        equip_count = 0
    THEN
        raise_application_error(-42,'Оборудование не найдено');
    END IF;
    SELECT
        COUNT(*)
    INTO equip_count
    FROM
        scd_equip_kits sek
        JOIN scd_contracts sc ON sc.id_contract_inst = sek.id_contract_inst
                                 AND sc.b_agency = 1
    WHERE
        sek.id_equip_kits_inst = id_equip_kits_inst
        AND sek.dt_start <= current_timestamp
        AND sek.dt_stop > current_timestamp;

    IF
        equip_count = 0
    THEN
        SELECT
            sek.v_ext_ident
        INTO ans
        FROM
            scd_equip_kits sek
        WHERE
            sek.id_equip_kits_inst = id_equip_kits_inst
            AND sek.dt_start <= current_timestamp
            AND sek.dt_stop > current_timestamp;

    ELSE
        SELECT
            sek.v_cas_id
        INTO ans
        FROM
            scd_equip_kits sek
        WHERE
            sek.id_equip_kits_inst = id_equip_kits_inst
            AND sek.dt_start <= current_timestamp
            AND sek.dt_stop > current_timestamp;

    END IF;

    RETURN ans;
END;
```
