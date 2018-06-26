```sql
/*
Реализовать процедуру saveSigners, принимающую на вход ФИО подписанта(pV_FIO)
код пользователя(pID_MANAGER) и действие(pACTION).

В процедуре: а) Реализовать проверку существования в таблице ci_users строчки 
кодом пользователя(ci_users.id_user = pID_MANAGER). В случае, если пользователь
не найден, выдать ошибку (команда raise_application_error, код ошибки -20020)
"Пользователь не найден".
Рекомендация - либо использовать count и if, либо обработку ошибок
begin ... exception when no_data found ... end;
б) В зависимости от действия pACTION: если pACTION = 1,
тогда реализовать добавление в таблицу scd_signers строчки (pV_FIO, pID_MANAGER).
В случае, если запись с данным id_manager уже присутствует, выдать ошибку
если pACTION = 2, тогда реализовать редактирование в таблице scd_signers параметра
V_FIO строчки с данным id_manager. если pACTION = 3, реализовать удаление строки с
данным id_manager. Рекомендация - использовать команду case.
*/
CREATE OR REPLACE PROCEDURE savesigners (
    pv_fio        IN VARCHAR2,
    pid_manager   IN NUMBER,
    paction       IN NUMBER
) IS
    user_count   NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO user_count
    FROM
        ci_users cu
    WHERE
        cu.id_user = pid_manager;

    IF
        user_count = 0
    THEN
        raise_application_error(-20020,'Пользователь не найден');
    END IF;
    CASE
        paction
        WHEN 1 THEN  -- Добавить
            SELECT
                COUNT(*)
            INTO user_count
            FROM
                scd_signers ss
            WHERE
                ss.id_manager = pid_manager;

            IF
                user_count > 0
            THEN
                raise_application_error(-42,'Запись с данным id_manager = '
                                             || pid_manager
                                             || ' уже присутствует');
            END IF;

            INSERT INTO scd_signers ss (
                ss.v_fio,
                ss.id_manager
            ) VALUES (
                pv_fio,
                pid_manager
            );

        WHEN 2 THEN  -- Заменить
            UPDATE scd_signers ss
            SET
                ss.id_manager = pid_manager,
                ss.v_fio = pv_fio
            WHERE
                ss.id_manager = pid_manager;

        WHEN 3 THEN  -- Удалить
            DELETE FROM scd_signers ss
            WHERE
                ss.id_manager = pid_manager;

        ELSE
            raise_application_error(-42,'Неизвестное действие pACTION = ' || paction);
    END CASE;

END;
```
