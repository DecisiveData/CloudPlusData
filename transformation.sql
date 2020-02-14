CREATE OR REPLACE TABLE "SALESFORCE_CPD"."REPORT_PIPELINE" COPY GRANTS AS
SELECT
    --Dimension Keys
    OPP.ID                      AS "Opportunity Id"
    ,OPP.ACCOUNT_ID             AS "Account Id"
    ,OPP.OWNER_ID               AS "Owner Id"
    ,OPP.PRICEBOOK_2_ID         AS "Pricebook Id"
    ,OPP.CLOSE_DATE             AS "Close Date"
    --Facts
    ,OPP.AMOUNT                 AS "Amount"
    ,OPP.PROBABILITY            AS "Probability"
    ,OPP.EXPECTED_REVENUE       AS "Expected Revenue"
    ,NULL::DECIMAL(10,2)        AS "Quota"
FROM
    "SALESFORCE_CPD"."OPPORTUNITY" OPP
WHERE
    OPP.IS_DELETED = FALSE
UNION ALL
SELECT
    NULL                        AS "Opportunity Id"
    ,NULL                       AS "Account Id"
    ,NULL                       AS "Owner Id"
    ,NULL                       AS "Pricebook Id"
    ,QUO.MONTH                  AS "Close Date"
    --Facts
    ,NULL                       AS "Amount"
    ,NULL                       AS "Probability"
    ,NULL                       AS "Expected Revenue"
    ,QUO.QUOTA                  AS "Quota"
FROM
    "SALESPLAN_CPD"."QUOTA" QUO
;