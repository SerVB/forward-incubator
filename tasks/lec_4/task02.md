```sql
/*
К описанному выше справочнику реализовать функцию check_access_comm,
принимающая на вход IP-адрес, V_COMMUNITY (доступ на чтение или запись)
и B_MODE_WRITE, который равен 1, если нужно проверить доступ на запись,
и 0 - на чтение. check_access_comm возвращает 1, если доступ есть, и 0 в противном случае.
Метод должен уметь выбрасывать исключения в случае, если коммутатора с таким IP не существует.
Результат: функция check_access_comm.
*/
CREATE OR REPLACE FUNCTION check_access_comm (
    ip_adress      IN incb_commutator.ip_address%TYPE,
    v_community    IN incb_commutator.v_community_read%TYPE,
    b_mode_write   IN NUMBER
) RETURN NUMBER IS
    tmp_count   NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO tmp_count
    FROM
        incb_commutator ic
    WHERE
        ic.b_deleted = 0
        AND ic.ip_address = ip_address;

    IF
        tmp_count = 0
    THEN
        raise_application_error(-20150,'Такого IP нет: ' || ip_adress);
    END IF;

    CASE
        b_mode_write
        WHEN 1 THEN
            SELECT
                COUNT(*)
            INTO tmp_count
            FROM
                incb_commutator ic
            WHERE
                ic.b_deleted = 0
                AND ic.ip_address = ip_address
                AND ic.v_community_write = v_community;

        WHEN 0 THEN
            SELECT
                COUNT(*)
            INTO tmp_count
            FROM
                incb_commutator ic
            WHERE
                ic.b_deleted = 0
                AND ic.ip_address = ip_address
                AND ic.v_community_read = v_community;
        ELSE
            raise_application_error(-20150,'Неправильный B_MODE_WRITE: ' || b_mode_write);
    END CASE;

    if tmp_count > 0 then
        return 1;
    else
        return 0;
    end if;
END;
```
