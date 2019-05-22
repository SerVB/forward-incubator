-- Скрипт создания таблиц и накачки данными
create table fw_identifiers
(
  id_identifier         NUMBER(10) not null,
  v_identifier_type     VARCHAR2(255),
  v_value               VARCHAR2(128 CHAR) not null,
  v_status              CHAR(1 CHAR) default 'N' not null,
  b_deleted             NUMBER(1) default 0 not null,
  v_ext_ident           VARCHAR2(20 CHAR)
)
/
insert into fw_identifiers(id_identifier, v_identifier_type, v_value, v_status, b_deleted, v_ext_ident)
  select 2000 + rownum, 'Тип ' || trunc(dbms_random.value(1, 6)), '00801' || 1000 + rownum, 'N', 0, to_char(rownum)
	from dual connect by level <= 100
/
-- 
create table FW_PROCESS_LOG
(
  ID_LOG              NUMBER NOT NULL,
  ID_PROCESS          NUMBER(10) NOT NULL,
  N_STATUS            NUMBER(10) NOT NULL,
  N_ACTION            NUMBER(10) DEFAULT 0 NOT NULL,
  DT_TIMESTAMP        TIMESTAMP(6) WITH LOCAL TIME ZONE NOT NULL,
  V_MESSAGE           VARCHAR2(4000),
  OS_USERNAME         VARCHAR2(255),
  USERHOST            VARCHAR2(128),
  SID                 NUMBER(10),
  ID_USER             NUMBER(10),
  ID_ERROR_CODE       NUMBER(10),
  B_PROCESSED         NUMBER(1) DEFAULT 0 NOT NULL
)
/
--
create table FW_TRANSFERS
(
  id_transfer_inst   NUMBER(10) not null,
  id_contract_from   NUMBER(10) not null,
  id_contract_to     NUMBER(10) not null,
  dt_incoming        TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  dt_real            TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  v_description      VARCHAR2(255),
  n_sum              NUMBER not null,
  v_code_currency    VARCHAR2(100),
  n_uncovered_sum    NUMBER default 0 not null,
  b_external_confirm NUMBER(1) default 0 not null
)
/
alter session set NLS_LANGUAGE='RUSSIAN';
alter session set NLS_TERRITORY='RUSSIA';
alter session set NLS_CURRENCY='р.';
alter session set NLS_ISO_CURRENCY='RUSSIA';
alter session set NLS_NUMERIC_CHARACTERS='.,';
alter session set NLS_CALENDAR='GREGORIAN';
alter session set NLS_DATE_FORMAT='YYYY-MM-DD';
alter session set NLS_DATE_LANGUAGE='RUSSIAN';
alter session set NLS_SORT='BINARY';
alter session set NLS_TIME_FORMAT='HH24:MI:SSXFF';
alter session set NLS_TIMESTAMP_FORMAT='YYYY-MM-DD HH24:MI:SSXFF';
alter session set NLS_TIME_TZ_FORMAT='HH24:MI:SSXFF TZR';
alter session set NLS_TIMESTAMP_TZ_FORMAT='YYYY-MM-DD HH24:MI:SSXFF TZR';
alter session set NLS_DUAL_CURRENCY='р.';
alter session set NLS_COMP='BINARY';
alter session set NLS_LENGTH_SEMANTICS='BYTE';
alter session set NLS_NCHAR_CONV_EXCP='FALSE';

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233989042, 5, 100, 10, '2018-03-12 19:50:28.011786', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9923799, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233988831, 5, 100, 11, '2018-03-12 19:07:28.131375', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 58. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.110471000', 'oracle', 'intro.pt.local', 9922081, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233988496, 5, 100, 11, '2018-03-12 18:00:28.093458', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 58. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.072828000', 'oracle', 'intro.pt.local', 9919425, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233984209, 5, 100, 11, '2018-03-12 03:53:29.036695', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 58. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.094934000', 'oracle', 'intro.pt.local', 9885641, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233984040, 5, 100, 10, '2018-03-12 03:20:28.800583', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9884329, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233981545, 5, 100, 12, '2018-03-11 19:22:28.731646', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9865250, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233981209, 5, 100, 10, '2018-03-11 18:15:28.007116', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9862583, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233978627, 5, 100, 12, '2018-03-11 09:38:28.462195', 'Загрузка порции заказов начиная с 3310835', 'oracle', 'intro.pt.local', 9841989, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233977454, 5, 100, 10, '2018-03-11 05:44:28.115380', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9832699, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233977290, 5, 100, 12, '2018-03-11 05:11:29.103229', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9831380, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233975946, 5, 500, 20, '2018-03-11 00:42:28.037150', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9820653, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233975787, 5, 100, 12, '2018-03-11 00:10:28.063728', 'Загрузка порции заказов начиная с 3310835', 'oracle', 'intro.pt.local', 9819375, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233974212, 5, 100, 11, '2018-03-10 19:12:28.120233', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.108803000', 'oracle', 'intro.pt.local', 9807495, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233974106, 5, 100, 12, '2018-03-10 18:51:28.069295', 'Загрузка порции заказов начиная с 3310828', 'oracle', 'intro.pt.local', 9806658, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233973757, 5, 100, 11, '2018-03-10 17:41:28.073809', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.068120000', 'oracle', 'intro.pt.local', 9803872, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233973212, 5, 100, 11, '2018-03-10 15:52:28.863354', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067930000', 'oracle', 'intro.pt.local', 9799527, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233972191, 5, 100, 12, '2018-03-10 12:28:28.523682', 'Загрузка порции заказов начиная с 3310828', 'oracle', 'intro.pt.local', 9791404, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233971770, 5, 500, 20, '2018-03-10 11:04:28.245245', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9788070, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233968349, 5, 100, 12, '2018-03-09 23:40:28.010479', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9760811, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233967865, 5, 500, 20, '2018-03-09 22:03:28.038662', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9756945, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233966302, 5, 100, 11, '2018-03-09 16:50:28.100323', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.095675000', 'oracle', 'intro.pt.local', 9744476, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233964122, 5, 100, 11, '2018-03-09 09:34:28.082357', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.072642000', 'oracle', 'intro.pt.local', 9727111, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233963555, 5, 500, 20, '2018-03-09 07:41:28.039892', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9722618, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233963076, 5, 100, 12, '2018-03-09 06:05:28.070193', 'Загрузка порции заказов начиная с 3310828', 'oracle', 'intro.pt.local', 9718790, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233962840, 5, 500, 20, '2018-03-09 05:18:28.038626', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9716917, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233962825, 5, 500, 20, '2018-03-09 05:15:28.041762', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9716803, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233961384, 5, 100, 12, '2018-03-09 00:27:28.006332', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9705306, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233959723, 5, 100, 10, '2018-03-08 18:55:28.024373', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9692188, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233959706, 5, 100, 12, '2018-03-08 18:51:28.076014', 'Загрузка порции заказов начиная с 3310828', 'oracle', 'intro.pt.local', 9692016, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233958793, 5, 100, 10, '2018-03-08 15:49:28.013313', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9684772, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233958342, 5, 100, 11, '2018-03-08 14:18:28.074425', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 62. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.066831000', 'oracle', 'intro.pt.local', 9681150, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233958015, 5, 500, 20, '2018-03-08 13:13:28.040561', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9678563, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233957150, 5, 500, 20, '2018-03-08 10:20:28.042844', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9671677, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233953931, 5, 100, 12, '2018-03-07 23:36:28.068864', 'Загрузка порции заказов начиная с 3310828', 'oracle', 'intro.pt.local', 9659803, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233953302, 5, 100, 12, '2018-03-07 21:31:28.005707', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9658674, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233951982, 5, 100, 10, '2018-03-07 17:24:28.004639', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9656453, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233951651, 5, 100, 12, '2018-03-07 16:24:28.305777', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9655872, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233951413, 5, 500, 20, '2018-03-07 15:37:28.359637', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9655424, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233949431, 5, 100, 10, '2018-03-07 09:01:28.803090', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9651588, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233948695, 5, 100, 12, '2018-03-07 06:34:28.262788', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9650163, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233948672, 5, 100, 10, '2018-03-07 06:30:28.208636', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9650127, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233948493, 5, 100, 12, '2018-03-07 05:54:28.207946', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9649784, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233947856, 5, 100, 11, '2018-03-07 03:46:28.071384', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063715000', 'oracle', 'intro.pt.local', 9648542, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233947611, 5, 100, 11, '2018-03-07 02:57:28.068086', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.061514000', 'oracle', 'intro.pt.local', 9648071, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233947169, 5, 500, 20, '2018-03-07 01:29:28.038498', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9647207, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233946847, 5, 100, 10, '2018-03-07 00:25:28.008264', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9646594, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233946066, 5, 100, 11, '2018-03-06 21:48:28.076450', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.069430000', 'oracle', 'intro.pt.local', 9645056, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233945780, 5, 100, 12, '2018-03-06 20:51:28.061844', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9644510, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233945277, 5, 100, 10, '2018-03-06 19:11:28.411524', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9643531, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233944616, 5, 100, 11, '2018-03-06 16:58:28.074925', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.065338000', 'oracle', 'intro.pt.local', 9642222, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233943979, 5, 500, 20, '2018-03-06 14:51:28.456478', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9640975, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233943174, 5, 500, 20, '2018-03-06 12:10:28.132270', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9639412, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233942290, 5, 100, 12, '2018-03-06 09:13:28.055873', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9637682, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233941270, 5, 100, 12, '2018-03-06 05:49:28.064073', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9635715, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233941129, 5, 500, 20, '2018-03-06 05:21:28.035824', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9635438, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233941009, 5, 500, 20, '2018-03-06 04:57:28.035266', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9635209, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233937885, 5, 100, 12, '2018-03-05 18:32:28.463493', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9629305, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233937467, 5, 100, 10, '2018-03-05 17:09:28.406200', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9628803, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233936323, 5, 100, 12, '2018-03-05 13:21:28.465169', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9627401, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233936268, 5, 100, 12, '2018-03-05 13:10:28.466557', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9627343, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233935741, 5, 100, 10, '2018-03-05 11:26:28.411326', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9626702, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233934124, 5, 100, 12, '2018-03-05 06:02:28.461960', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9624806, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233932738, 5, 500, 20, '2018-03-05 01:25:28.428644', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9623175, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233932251, 5, 100, 10, '2018-03-04 23:48:28.405194', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9622605, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233932227, 5, 100, 12, '2018-03-04 23:43:28.410502', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9622578, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233851973, 5, 500, 20, '2018-02-21 21:18:28.633053', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9528709, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233850075, 5, 100, 12, '2018-02-21 15:23:28.206639', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9526279, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233845216, 5, 500, 20, '2018-02-21 00:02:28.034299', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9519823, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233844937, 5, 100, 12, '2018-02-20 23:06:28.081872', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9519443, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233844498, 5, 100, 11, '2018-02-20 21:38:28.077945', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.066680000', 'oracle', 'intro.pt.local', 9518826, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233843874, 9, 100, 2011, '2018-02-20 19:52:47.000000', 'Пользователь @192.168.198.2 вышел из системы', 'almatv', 'intro.pt.local', 9517499, null, null, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233843790, 9, 100, 2010, '2018-02-20 19:39:29.000000', 'Пользователь abogomolov@192.168.198.2 вошел в систему', 'almatv', 'intro.pt.local', 9517718, 11136, null, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233843715, 5, 500, 20, '2018-02-20 19:28:28.533736', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9517734, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233843620, 5, 100, 11, '2018-02-20 19:13:28.569407', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.061389000', 'oracle', 'intro.pt.local', 9517632, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233841674, 5, 100, 10, '2018-02-20 14:18:28.003341', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9515485, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233841610, 9, 100, 2010, '2018-02-20 14:08:48.000000', 'Пользователь abogomolov@192.168.198.2 вошел в систему', 'almatv', 'intro.pt.local', 9515323, 11136, null, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233840645, 5, 100, 12, '2018-02-20 11:15:28.073495', 'Загрузка порции заказов начиная с 3310797', 'oracle', 'intro.pt.local', 9514204, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233840520, 9, 100, 2011, '2018-02-20 10:54:07.000000', 'Пользователь azelenkov@192.168.198.2 вышел из системы', 'almatv', 'intro.pt.local', 9514027, 2021, null, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233840487, 5, 100, 12, '2018-02-20 10:48:28.007109', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9514018, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233839624, 5, 100, 11, '2018-02-20 07:57:28.076490', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.072334000', 'oracle', 'intro.pt.local', 9512842, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233839296, 5, 500, 20, '2018-02-20 06:53:28.035265', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9512402, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233839014, 5, 100, 10, '2018-02-20 05:57:28.009710', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9512015, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233838405, 5, 100, 12, '2018-02-20 03:55:28.103953', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9511182, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233837562, 5, 100, 12, '2018-02-20 01:10:28.170263', 'Загрузка порции заказов начиная с 3310797', 'oracle', 'intro.pt.local', 9510052, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233837261, 5, 100, 12, '2018-02-20 00:19:28.112733', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9509689, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233835236, 2017, 100, 0, '2018-02-19 19:56:49.642230', '[COLLAPSE]Не удалось схлопнуть => Удаляем интервал 12656197', 'oracle', 'intro.pt.local', 9507885, null, -1, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233832772, 2017, 100, 0, '2018-02-19 19:51:32.478081', '[COLLAPSE]Получен интервал для схлопывания 12619835', 'oracle', 'intro.pt.local', 9507885, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233831397, 2017, 100, 0, '2018-02-19 19:50:29.810787', '[COLLAPSE]Получен интервал для схлопывания 12614006', 'oracle', 'intro.pt.local', 9507885, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233829759, 2017, 100, 0, '2018-02-19 19:47:36.676560', '[COLLAPSE]Не удалось схлопнуть => Удаляем интервал 12612988', 'oracle', 'intro.pt.local', 9507876, null, -1, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233827311, 5, 100, 10, '2018-02-19 14:15:28.005686', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9505657, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233826642, 5, 100, 12, '2018-02-19 12:08:28.060143', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9504757, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233824340, 5, 100, 11, '2018-02-19 04:30:28.793185', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.088153000', 'oracle', 'intro.pt.local', 9501677, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233823674, 5, 100, 12, '2018-02-19 02:17:28.070188', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9500799, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233822896, 5, 100, 10, '2018-02-18 23:42:28.009195', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9499776, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233821809, 5, 100, 12, '2018-02-18 20:04:28.059620', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9498339, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233821076, 5, 100, 10, '2018-02-18 17:38:28.005359', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9497378, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233820760, 5, 100, 11, '2018-02-18 16:34:28.070964', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063338000', 'oracle', 'intro.pt.local', 9496958, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233819241, 5, 100, 10, '2018-02-18 11:31:28.004548', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9494964, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233818882, 5, 100, 12, '2018-02-18 10:19:28.005553', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9494489, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233818634, 5, 100, 12, '2018-02-18 09:29:28.060746', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9494157, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233816590, 5, 100, 11, '2018-02-18 02:40:28.670599', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.072479000', 'oracle', 'intro.pt.local', 9491469, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233816467, 5, 100, 12, '2018-02-18 02:16:28.207115', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9491308, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233813422, 5, 100, 10, '2018-02-17 16:08:28.004760', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9487306, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233813036, 5, 100, 11, '2018-02-17 14:50:28.103490', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.096239000', 'oracle', 'intro.pt.local', 9486795, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233811969, 5, 500, 20, '2018-02-17 11:17:28.340438', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9485390, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233932144, 5, 100, 12, '2018-03-04 23:26:28.457268', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9622470, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233932047, 5, 100, 12, '2018-03-04 23:07:28.411518', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9622360, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233926797, 5, 100, 12, '2018-03-04 05:37:28.212722', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9616213, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233921631, 5, 100, 10, '2018-03-03 12:25:28.003232', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9610169, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233920934, 5, 100, 12, '2018-03-03 10:05:28.063377', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9609350, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233919568, 5, 500, 20, '2018-03-03 05:32:28.032795', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9607755, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233915790, 5, 500, 20, '2018-03-02 17:03:28.034372', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9603362, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233915347, 5, 100, 11, '2018-03-02 15:34:28.067274', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063560000', 'oracle', 'intro.pt.local', 9602791, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233914862, 5, 100, 10, '2018-03-02 14:04:28.007224', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9602245, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233913401, 5, 500, 20, '2018-03-02 09:16:28.836150', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9600523, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233911568, 5, 100, 11, '2018-03-02 03:09:28.891879', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.083571000', 'oracle', 'intro.pt.local', 9598380, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233911518, 5, 100, 11, '2018-03-02 02:59:28.871925', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063596000', 'oracle', 'intro.pt.local', 9598319, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233910899, 5, 100, 10, '2018-03-02 00:56:28.811695', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9597594, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233908578, 5, 100, 11, '2018-03-01 17:11:28.694524', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.084618000', 'oracle', 'intro.pt.local', 9594855, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233908504, 5, 100, 12, '2018-03-01 16:57:28.603438', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9594773, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233908190, 5, 100, 11, '2018-03-01 15:54:28.664151', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.059635000', 'oracle', 'intro.pt.local', 9594405, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233907340, 5, 100, 11, '2018-03-01 13:04:28.667319', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.057926000', 'oracle', 'intro.pt.local', 9593400, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233905903, 5, 100, 10, '2018-03-01 08:18:28.605717', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9591732, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233905117, 5, 100, 11, '2018-03-01 05:40:28.673582', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.064296000', 'oracle', 'intro.pt.local', 9590816, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233904046, 5, 100, 12, '2018-03-01 02:06:28.458481', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9589559, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233903446, 5, 100, 12, '2018-03-01 00:06:28.462729', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9588849, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233902880, 5, 500, 20, '2018-02-28 22:13:28.437745', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9588194, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233901585, 5, 100, 12, '2018-02-28 17:58:28.404611', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9586689, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233901193, 5, 100, 11, '2018-02-28 16:49:28.495031', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 59. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.087552000', 'oracle', 'intro.pt.local', 9586286, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233900988, 5, 100, 12, '2018-02-28 16:12:28.453442', 'Загрузка порции заказов начиная с 3310818', 'oracle', 'intro.pt.local', 9586076, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233895234, 5, 100, 10, '2018-02-27 21:12:28.204081', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9579383, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233894578, 5, 100, 11, '2018-02-27 19:00:28.282145', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 57. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.076168000', 'oracle', 'intro.pt.local', 9578608, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233892734, 5, 500, 20, '2018-02-27 12:52:28.236641', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9576435, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233892525, 5, 100, 12, '2018-02-27 12:10:28.256544', 'Загрузка порции заказов начиная с 3310809', 'oracle', 'intro.pt.local', 9576186, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233892226, 5, 100, 12, '2018-02-27 11:11:28.209383', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9575845, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233890994, 5, 100, 12, '2018-02-27 07:12:28.210235', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9574438, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233889318, 5, 100, 10, '2018-02-27 01:37:28.004891', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9572463, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233888327, 5, 100, 11, '2018-02-26 22:18:28.062503', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.056960000', 'oracle', 'intro.pt.local', 9571281, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233888309, 5, 100, 12, '2018-02-26 22:15:28.004802', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9571266, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233887159, 5, 100, 12, '2018-02-26 18:25:28.006767', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9569913, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233886999, 5, 100, 12, '2018-02-26 17:53:28.007727', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9569728, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233886538, 5, 100, 10, '2018-02-26 16:21:28.005841', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9569173, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233886355, 5, 500, 20, '2018-02-26 15:44:28.038701', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9568961, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233885079, 5, 100, 11, '2018-02-26 11:30:28.063833', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.055425000', 'oracle', 'intro.pt.local', 9567476, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233885024, 5, 100, 11, '2018-02-26 11:19:28.081108', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.075088000', 'oracle', 'intro.pt.local', 9567400, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233884423, 5, 100, 12, '2018-02-26 09:19:28.057649', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9566707, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233883881, 5, 100, 12, '2018-02-26 07:31:28.009897', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9566072, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233883412, 5, 500, 20, '2018-02-26 05:57:28.034046', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9565525, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233882216, 5, 100, 12, '2018-02-26 01:58:28.008447', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9564127, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233881926, 5, 100, 12, '2018-02-26 01:00:28.011939', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9563789, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233881761, 5, 100, 12, '2018-02-26 00:27:28.004759', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9563597, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233881579, 5, 100, 11, '2018-02-25 23:50:28.070872', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.059107000', 'oracle', 'intro.pt.local', 9563375, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233881045, 5, 100, 10, '2018-02-25 22:04:28.803438', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9562757, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233880341, 5, 100, 12, '2018-02-25 19:43:28.412806', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9561933, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233880002, 5, 500, 20, '2018-02-25 18:35:28.434982', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9561534, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233879229, 5, 100, 11, '2018-02-25 16:00:28.470738', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.060878000', 'oracle', 'intro.pt.local', 9560629, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233878343, 5, 100, 12, '2018-02-25 13:03:28.450963', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9559596, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233877611, 5, 100, 12, '2018-02-25 10:37:28.412555', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9558740, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233876790, 5, 100, 10, '2018-02-25 07:53:28.412404', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9557773, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233873247, 5, 500, 20, '2018-02-24 20:04:28.432932', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9553627, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233872433, 5, 100, 12, '2018-02-24 17:21:28.456546', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9552677, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233871479, 5, 100, 11, '2018-02-24 14:10:28.468108', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.056468000', 'oracle', 'intro.pt.local', 9551559, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233870509, 5, 100, 12, '2018-02-24 10:57:28.212754', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9550434, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233869761, 5, 100, 11, '2018-02-24 08:27:28.265936', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.055305000', 'oracle', 'intro.pt.local', 9549555, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233868831, 5, 100, 11, '2018-02-24 05:21:28.265560', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.055084000', 'oracle', 'intro.pt.local', 9548461, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233868368, 5, 100, 12, '2018-02-24 03:49:28.206473', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9547924, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233865538, 5, 100, 12, '2018-02-23 18:25:28.055799', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9544604, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233863278, 5, 100, 12, '2018-02-23 10:54:28.009863', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9541957, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233862788, 5, 100, 12, '2018-02-23 09:16:28.009628', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9541377, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233862709, 5, 500, 20, '2018-02-23 09:00:28.067203', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9541287, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233861667, 5, 100, 10, '2018-02-23 05:32:28.011481', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9540069, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233860221, 5, 100, 11, '2018-02-23 00:42:28.087685', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.074502000', 'oracle', 'intro.pt.local', 9538370, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233859571, 5, 100, 11, '2018-02-22 22:32:28.065487', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 56. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.056910000', 'oracle', 'intro.pt.local', 9537616, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233859304, 5, 500, 20, '2018-02-22 21:39:28.038460', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9537299, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233858454, 5, 100, 12, '2018-02-22 18:49:28.059563', 'Загрузка порции заказов начиная с 3310806', 'oracle', 'intro.pt.local', 9536308, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233855587, 5, 100, 12, '2018-02-22 09:21:28.011190', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9532947, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233853342, 5, 100, 12, '2018-02-22 01:52:28.007170', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9530322, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233811700, 5, 100, 12, '2018-02-17 10:23:28.365026', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9485035, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233811308, 5, 100, 12, '2018-02-17 09:05:28.311239', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9484524, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233811066, 5, 100, 11, '2018-02-17 08:16:28.373711', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067482000', 'oracle', 'intro.pt.local', 9484199, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233810721, 5, 100, 11, '2018-02-17 07:07:28.367727', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063534000', 'oracle', 'intro.pt.local', 9483747, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233810373, 5, 100, 12, '2018-02-17 05:58:28.307302', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9483287, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233807103, 5, 100, 10, '2018-02-16 19:05:28.110661', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9478985, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233806869, 5, 500, 20, '2018-02-16 18:18:28.139689', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9478675, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233805986, 5, 100, 11, '2018-02-16 15:21:28.179182', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067472000', 'oracle', 'intro.pt.local', 9477512, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233805586, 5, 100, 11, '2018-02-16 14:01:28.180128', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067530000', 'oracle', 'intro.pt.local', 9476989, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233805521, 5, 100, 11, '2018-02-16 13:48:28.171624', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067755000', 'oracle', 'intro.pt.local', 9476900, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233804516, 5, 100, 10, '2018-02-16 10:28:28.908760', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9475579, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233804186, 5, 100, 10, '2018-02-16 09:22:28.247997', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9475147, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233803962, 5, 100, 12, '2018-02-16 08:37:28.010056', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9474853, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233802661, 5, 100, 10, '2018-02-16 04:17:28.007675', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9473143, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233802306, 5, 100, 10, '2018-02-16 03:06:28.004669', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9472678, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233800210, 5, 100, 11, '2018-02-15 20:06:28.683926', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.080096000', 'oracle', 'intro.pt.local', 9469904, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233799495, 5, 100, 11, '2018-02-15 17:43:28.175808', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063968000', 'oracle', 'intro.pt.local', 9468961, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233798470, 5, 500, 20, '2018-02-15 14:19:28.141008', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9467593, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233798382, 5, 100, 11, '2018-02-15 14:01:28.172792', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067070000', 'oracle', 'intro.pt.local', 9467474, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233794739, 5, 100, 10, '2018-02-15 01:57:28.204884', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9462685, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233794654, 5, 100, 10, '2018-02-15 01:40:28.210166', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9462577, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233793302, 5, 100, 12, '2018-02-14 21:09:28.290104', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9460780, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233793186, 5, 100, 12, '2018-02-14 20:47:28.272808', 'Загрузка порции заказов начиная с 3310794', 'oracle', 'intro.pt.local', 9460636, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233790438, 8, 100, 20, '2018-02-14 12:23:05.693489', 'Изменение Flexy-объекта "Продажа (Горсвязь)", изменение', 'Makedon', 'WORKGROUP\ANDREY', 9457126, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233789436, 5, 100, 10, '2018-02-14 09:16:28.022360', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9455817, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233788966, 5, 100, 10, '2018-02-14 07:42:28.007833', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9455176, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233788489, 5, 100, 11, '2018-02-14 06:06:28.072449', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063924000', 'oracle', 'intro.pt.local', 9454521, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233786870, 5, 100, 10, '2018-02-14 00:43:28.011114', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9452299, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233786202, 5, 100, 12, '2018-02-13 22:31:28.007148', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9451401, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233782191, 5, 100, 11, '2018-02-13 09:12:28.073024', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.063433000', 'oracle', 'intro.pt.local', 9445871, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233781499, 5, 500, 20, '2018-02-13 06:54:28.031437', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9444922, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233781001, 5, 100, 11, '2018-02-13 05:14:28.068316', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.061836000', 'oracle', 'intro.pt.local', 9444241, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233780237, 5, 100, 10, '2018-02-13 02:42:28.008140', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9443202, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233780043, 5, 100, 12, '2018-02-13 02:03:28.006561', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9442932, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233779018, 5, 100, 12, '2018-02-12 22:44:28.467188', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9441561, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233776775, 5, 100, 12, '2018-02-12 15:22:28.064739', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9438485, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233776413, 5, 100, 11, '2018-02-12 14:10:28.075648', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.067932000', 'oracle', 'intro.pt.local', 9437991, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233775968, 5, 100, 12, '2018-02-12 12:42:28.664752', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9437369, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233773878, 5, 100, 11, '2018-02-12 05:46:28.074907', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.068297000', 'oracle', 'intro.pt.local', 9434449, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233771006, 5, 500, 20, '2018-02-11 20:12:28.474783', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9430509, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233770736, 5, 500, 20, '2018-02-11 19:18:28.436613', 'Заказ 2520123 на состоянии 18573757/6 продвинут с ошибкой: ORA-20307: Движение с кодом 2520123 на состоянии 18573757 уже закрыто. Оптимистический подход к работе над состоянием позволяет лишь отследить такие ситуации, но не предотвратить.. Stacktrace: ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1244
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1718
ORA-06512: на  "ALMA_TEST1.PACK_FLOW", line 1907
', 'oracle', 'intro.pt.local', 9430136, null, -20307, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233770134, 5, 100, 10, '2018-02-11 17:18:28.210923', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9429296, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233770099, 5, 100, 10, '2018-02-11 17:11:28.208982', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9429251, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233770057, 5, 100, 12, '2018-02-11 17:02:28.261525', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9429188, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233769524, 5, 100, 10, '2018-02-11 15:16:28.212956', 'Процесс продвижения заказов запущен. Порция: 5000. Режим сглаживания нагрузки: да', 'oracle', 'intro.pt.local', 9428465, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233768303, 5, 100, 11, '2018-02-11 11:11:28.378056', 'Процесс продвижения заказов завершен. Проверено состояний заказов: 55. Обработано заказов: 0. Общее время выполнения : +000000000 00:00:00.068268000', 'oracle', 'intro.pt.local', 9426778, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233766870, 5, 100, 12, '2018-02-11 06:25:28.111529', 'Загрузка порции заказов начиная с -1', 'oracle', 'intro.pt.local', 9424815, null, 0, 0);

insert into fw_process_log (ID_LOG, ID_PROCESS, N_STATUS, N_ACTION, DT_TIMESTAMP, V_MESSAGE, OS_USERNAME, USERHOST, SID, ID_USER, ID_ERROR_CODE, B_PROCESSED)
values (233766447, 5, 100, 12, '2018-02-11 05:00:28.192699', 'Загрузка порции заказов начиная с 3310731', 'oracle', 'intro.pt.local', 9424236, null, 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38430, 1116445, 1116445, '2017-03-21 13:40:16', '2017-03-21 13:39:35', null, 300, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38429, 1116445, 1116445, '2017-03-21 13:38:59', '2017-03-21 13:36:45', null, 495, 'KZT', 495, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38428, 1916109, 1916109, '2017-03-21 13:09:51', '2017-03-21 13:08:53', null, 900, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38427, 1916109, 1916109, '2017-03-21 13:04:14', '2017-03-21 12:39:45', 'Ай-я-яй', 900, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38426, 1916109, 1916109, '2017-03-21 13:04:12', '2017-03-21 12:54:56', 'Ойййй', 900, 'KZT', 900, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38418, 935032, 996132, '2017-02-14 11:12:01', '2017-02-14 11:11:39', 'заявление', 2700.18, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38417, 1003436, 1935343, '2017-02-14 11:10:46', '2017-02-14 11:10:12', 'заявление', 1693.68, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38416, 1052626, 1935277, '2017-02-14 11:09:28', '2017-02-14 11:09:01', 'заявление', 5075.18, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38415, 1916482, 1916482, '2017-02-14 11:03:01', '2017-02-14 11:02:31', 'на оснований заявления', 900, 'KZT', 900, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38414, 384136, 451155, '2017-02-14 11:00:12', '2017-02-14 10:59:30', 'на оснований заявления', 4468.17, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38413, 831162, 835259, '2017-02-14 10:55:18', '2017-02-14 10:54:40', 'заявление абонента', 3100, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38412, 481973, 523645, '2017-02-14 10:25:57', '2017-02-14 10:25:16', 'Согласно заявления', 1610.02, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38411, 498116, 1934707, '2017-02-14 10:18:18', '2017-02-14 10:17:41', 'Согласно заявления', 9373.87, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38410, 1935626, 1935626, '2017-02-14 09:36:02', '2017-02-14 09:35:41', 'кв', 900, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38409, 1861935, 1935626, '2017-02-14 09:35:16', '2017-02-14 09:34:36', 'на основании заявления абонента', 820, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38408, 1933842, 1933842, '2017-02-14 09:10:49', '2017-02-14 09:10:11', 'СЗ № 111 от 14.02.2017', 900, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38407, 542294, 1934980, '2017-02-14 09:06:53', '2017-02-14 09:06:02', 'СЗ № 110 от 14.02.2017', 2458.33, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38406, 571907, 571907, '2017-02-14 09:04:38', '2017-02-14 09:04:01', 'СЗ № 109 от 14.02.2017', 495, 'KZT', 495, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38405, 1934980, 1934980, '2017-02-14 09:02:53', '2017-02-14 09:02:01', 'СЗ № 108 от 14.02.2017', 900, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38404, 530541, 1934948, '2017-02-14 08:54:05', '2017-02-14 08:53:18', 'СЗ № 105 от 14.02.2017', 3966.41, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38403, 143312, 1882256, '2017-02-14 08:51:56', '2017-02-14 08:51:17', 'перевод абон.платы согласно заявления', 557, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38402, 453813, 453813, '2017-02-14 08:42:36', '2017-02-14 08:42:08', 'по заявлению абонента', 850, 'KZT', 850, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38401, 143312, 143312, '2017-02-14 08:37:49', '2017-02-14 08:37:27', 'расторжение', 541, 'KZT', 541, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38400, 1306203, 1924626, '2017-02-14 08:09:19', '2017-02-14 08:08:24', 'письмо №2615-02,02,2017+ акт сверки', 4168.31, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38399, 1745846, 1813292, '2017-02-14 07:59:41', '2017-02-14 07:58:24', 'заявление №3018-08,02,2017', 3811.5, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38398, 1428865, 1399618, '2017-02-14 07:53:37', '2017-02-14 07:52:51', 'заявление №3090-10,02,2017', 4569.6, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38397, 1764308, 1925346, '2017-02-14 07:51:31', '2017-02-14 07:50:47', 'перенос №3276-14,02,2017', 2300.66, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38396, 970299, 910120, '2017-02-14 07:49:35', '2017-02-14 07:49:08', 'заявление', 1029.56, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38395, 1003481, 1013470, '2017-02-14 07:33:30', '2017-02-14 07:33:01', 'заявление', 1097.58, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38394, 1009800, 1935105, '2017-02-14 07:32:23', '2017-02-14 07:30:11', 'заявление абонента', 1335.29, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38393, 1887050, 1934291, '2017-02-14 06:56:13', '2017-02-14 06:55:27', 'перенос №3161-11,02,2017', 3117.85, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38392, 1342304, 1933852, '2017-02-14 06:19:52', '2017-02-14 06:18:22', 'перенос №3089-10,02,2017', 3594.74, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38391, 1632609, 1619405, '2017-02-14 06:12:23', '2017-02-14 06:11:32', 'перенос №2865-06,02,2017', 2054.35, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38390, 1371308, 1931785, '2017-02-14 06:05:38', '2017-02-14 06:04:39', 'перенос №2935-07,02,2017', 1255.44, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38389, 110438, 109854, '2017-02-14 06:00:19', '2017-02-14 05:59:27', null, 1396.43, 'KZT', 0, 0);

insert into fw_transfers (ID_TRANSFER_INST, ID_CONTRACT_FROM, ID_CONTRACT_TO, DT_INCOMING, DT_REAL, V_DESCRIPTION, N_SUM, V_CODE_CURRENCY, N_UNCOVERED_SUM, B_EXTERNAL_CONFIRM)
values (38388, 1933874, 1933874, '2017-02-14 05:03:23', '2017-02-14 05:02:27', 'с/з №3137-10,02,2017 залог на а/п', 900, 'KZT', 0, 0);
