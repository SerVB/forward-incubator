```sql
/*
К описанному выше справочнику реализовать функцию get_remote_id,
принимающую на вход код коммутатора и возвращающую
REMOTE_ID_HEX, если B_NEED_CONVERT_HEX = 1,
или REMOTE_ID, если B_NEED_CONVERT_HEX = 0.

Если B_NEED_CONVERT_HEX = 1, но идентификатор
коммутатора в hex формате пуст, нужно выбрасывать исключение.
Результат: функция get_remote_id.
*/
CREATE OR REPLACE FUNCTION get_remote_id (
    id_commutator   IN incb_commutator.id_commutator%TYPE
) RETURN incb_commutator.remote_id_hex%TYPE IS
    tmp_count       NUMBER;
    hex_count       NUMBER;
    not_hex_count   NUMBER;
    answer          incb_commutator.remote_id_hex%TYPE;
BEGIN
    SELECT
        COUNT(*)
    INTO tmp_count
    FROM
        incb_commutator ic
    WHERE
        ic.id_commutator = id_commutator
        AND ic.b_deleted = 0;

    IF
        tmp_count = 0
    THEN
        raise_application_error(-20150,'В таблице нет нужного коммутатора: ' || id_commutator);
    END IF;

    SELECT
        COUNT(*)
    INTO tmp_count
    FROM
        incb_commutator ic
    WHERE
        ic.id_commutator = id_commutator
        AND ic.b_deleted = 0
        AND ic.b_need_convert_hex = 1
        AND ic.remote_id_hex IS NULL;

    IF
        tmp_count > 0
    THEN
        raise_application_error(-20150,'Ошибка в таблице: есть строка, где b_need_convert_hex = 1, но remote_id_hex IS NULL');
    END IF;
    SELECT
        COUNT(*)
    INTO hex_count
    FROM
        incb_commutator ic
    WHERE
        ic.id_commutator = id_commutator
        AND ic.b_deleted = 0
        AND ic.b_need_convert_hex = 1;

    SELECT
        COUNT(*)
    INTO not_hex_count
    FROM
        incb_commutator ic
    WHERE
        ic.id_commutator = id_commutator
        AND ic.b_deleted = 0
        AND ic.b_need_convert_hex = 0;

    IF
        hex_count + not_hex_count > 1
    THEN
        raise_application_error(-20150,'Много подходящих строк в таблице, не знаю, что выдать');
    END IF;
    IF
        hex_count > 0
    THEN
        SELECT
            ic.remote_id_hex
        INTO answer
        FROM
            incb_commutator ic
        WHERE
            ic.id_commutator = id_commutator
            AND ic.b_deleted = 0
            AND ic.b_need_convert_hex = 1;

    ELSE
        SELECT
            ic.remote_id
        INTO answer
        FROM
            incb_commutator ic
        WHERE
            ic.id_commutator = id_commutator
            AND ic.b_deleted = 0
            AND ic.b_need_convert_hex = 0;

    END IF;

    RETURN answer;
END;
```
