--
-- Licensed Materials - Property of IBM
-- 5725-G92 (C) Copyright IBM Corp. 2011, 2013. All Rights Reserved.
-- US Government Users Restricted Rights - Use, duplication or
-- disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
--

CREATE SEQUENCE ADAPTER_SYNC_DATA_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE APP_SYNC_DATA_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE APP_VERSION_ACCESS_DATA_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE GADGETS_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE GADGET_APPLICATIONS_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE NOTIFICATION_DEVICE_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE NOTIFICATION_USER_SEQ START WITH 1 CACHE 50;
CREATE SEQUENCE USER_PREF_SEQ START WITH 1 CACHE 50;
CREATE TABLE ADAPTER_SYNC_DATA (ID BIGINT NOT NULL, deployable BLOB(1G), deployableHash VARCHAR(254) NOT NULL, deployableKey VARCHAR(254) NOT NULL, PRIMARY KEY (ID), CONSTRAINT UNQ_deployableKey UNIQUE (deployableKey));
CREATE TABLE APP_SYNC_DATA (ID BIGINT NOT NULL, appDeployableKey VARCHAR(254) NOT NULL, deployable BLOB(1G), deployableHash VARCHAR(254) NOT NULL, lastPersistentPropertyChange BIGINT NOT NULL, PRIMARY KEY (ID), CONSTRAINT UNQ_appDeployableKey UNIQUE (appDeployableKey));
CREATE TABLE APP_VERSION_ACCESS_DATA (ID BIGINT NOT NULL, ACTION VARCHAR(254) NOT NULL, CREATED_TIME TIMESTAMP NOT NULL, DOWNLOAD_LINK VARCHAR(254), ENV VARCHAR(254) NOT NULL, GADGET_NAME VARCHAR(254) NOT NULL, MESSAGE VARCHAR(254) NOT NULL, VERSION VARCHAR(254) NOT NULL, MULTILANGUAGE_MESSAGES CLOB(1M), PRIMARY KEY (ID), CONSTRAINT UNQ_GADGET_NAMENVVERSION UNIQUE (GADGET_NAME, ENV, VERSION));
CREATE TABLE AUTH_ASSOCIATED_IDENTITY (FROMLOGINMODULE VARCHAR(254) NOT NULL, FROMUSERID VARCHAR(254) NOT NULL, TOLOGINMODULE VARCHAR(254) NOT NULL, LASTACCESS BIGINT, TOIDENTITYSTR CLOB, TOUSERID VARCHAR(254), PRIMARY KEY (FROMLOGINMODULE, FROMUSERID, TOLOGINMODULE));
CREATE TABLE CLUSTER_SYNC (ID VARCHAR(254) NOT NULL, HOSTVMID VARCHAR(254), UPDATETIMESTAMP BIGINT, VERSION BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE GADGETS (ID BIGINT NOT NULL, DISP_IN_GALLERY SMALLINT, LAST_UPDATE_TIME TIMESTAMP NOT NULL, NAME VARCHAR(254) NOT NULL, PRIMARY KEY (ID), CONSTRAINT UNQ_ UNIQUE (NAME));
CREATE TABLE GADGET_APPLICATIONS (ID BIGINT NOT NULL, ENFORCE_AUTHENTICITY SMALLINT, ENVIRONMENT_ID VARCHAR(254) NOT NULL, SERVER_VERSION VARCHAR(254) NOT NULL, VERSION VARCHAR(254) NOT NULL, VERSION_LOCKED SMALLINT, GADGET_ID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE GADGET_USER (GADGET_APP_ID VARCHAR(254) NOT NULL, USER_ID VARCHAR(254) NOT NULL, FIRST_ACCESS_TIME DATE NOT NULL, GADGET_ID VARCHAR(254) NOT NULL, PRIMARY KEY (GADGET_APP_ID, USER_ID));
CREATE TABLE GADGET_USER_PREF (ID BIGINT NOT NULL, GADGET_APP_ID VARCHAR(254) NOT NULL, NAME VARCHAR(254) NOT NULL, USER_ID VARCHAR(254), VALUE CLOB, PRIMARY KEY (ID));
CREATE TABLE NOTIFICATION_APPLICATION (APPLICATIONID VARCHAR(254) NOT NULL, MEDIATORTYPE SMALLINT NOT NULL, PLATFORMSTR VARCHAR(254) NOT NULL, dataStr CLOB, ENABLED SMALLINT, PRIMARY KEY (APPLICATIONID, MEDIATORTYPE, PLATFORMSTR));
CREATE TABLE NOTIFICATION_DEVICE (ID BIGINT NOT NULL, ALIAS VARCHAR(254), APPLICATIONID VARCHAR(254) NOT NULL, DEVICE VARCHAR(254) NOT NULL, OPTIONS VARCHAR(254), PLATFORM VARCHAR(254) NOT NULL, TOKEN VARCHAR(254) NOT NULL, USERAGENT VARCHAR(254) NOT NULL, USERSUBSCRIPTIONID BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE NOTIFICATION_MEDIATOR (MEDIATORSTR VARCHAR(254) NOT NULL, stateStr CLOB, PRIMARY KEY (MEDIATORSTR));
CREATE TABLE NOTIFICATION_USER (ID BIGINT NOT NULL, EVENTSOURCE VARCHAR(254) NOT NULL, state CLOB, USERID VARCHAR(254) NOT NULL, PRIMARY KEY (ID), CONSTRAINT UNQ_USERIDEVENTSOURCE UNIQUE (USERID, EVENTSOURCE));
CREATE TABLE OPENJPA_SEQUENCE_TABLE (ID SMALLINT NOT NULL, SEQUENCE_VALUE BIGINT, PRIMARY KEY (ID));
CREATE TABLE PROPERTIES (PROPERTY VARCHAR(254) NOT NULL, VALUE VARCHAR(254), PRIMARY KEY (PROPERTY));
CREATE TABLE SSO_LOGIN_CONTEXTS (DEVICE_ID VARCHAR(254) NOT NULL, DEVICE_LOGIN_MODULE VARCHAR(254) NOT NULL, SSO_LOGIN_MODULE VARCHAR(254) NOT NULL, LOGIN_CONTEXT CLOB(1M), EXPIRES TIMESTAMP NOT NULL, PRIMARY KEY (DEVICE_ID, DEVICE_LOGIN_MODULE, SSO_LOGIN_MODULE));
CREATE TABLE USAGE_DATA (TIME_AT_BEGINING_OF_DAY BIGINT NOT NULL, USER_ID VARCHAR(254) NOT NULL, EXACT_LOGIN_TIME BIGINT, PRIMARY KEY (TIME_AT_BEGINING_OF_DAY, USER_ID));
CREATE TABLE WORKLIGHT_VERSION (WORKLIGHT_VERSION VARCHAR(50) NOT NULL);
INSERT INTO WORKLIGHT_VERSION(WORKLIGHT_VERSION) SELECT '0.0.0.initial' FROM SYSIBM.SYSDUMMY1 WHERE NOT EXISTS (SELECT * FROM WORKLIGHT_VERSION);
CREATE INDEX I_GDGTTNS_GADGET ON GADGET_APPLICATIONS (GADGET_ID);
CREATE INDEX I_NTFCDVC_PARENT ON NOTIFICATION_DEVICE (USERSUBSCRIPTIONID);

