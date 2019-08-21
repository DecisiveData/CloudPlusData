# Cloud + Data

This Cloud + Data repo is an interactive workshop for doing world-class analytics in the cloud. In this session we will demonstrate how quickly we can provision, configure, and deploy a a cloud analytics stack.

## Infrastructure

In this Cloud + Data event, we will build a cloud data analytics infrastructure with best of breed tools. The basic architecture is:

    Source -> Pipeline -> Warehouse -> Visualization

The tools we will use for this process are:

- Source: [**Salesforce**](https://www.salesforce.com)
- Pipeline: [**Fivetran**](https://fivetran.com/signup/decisive-data)
- Warehouse: [**Snowflake**](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data)
- Analytics: [**Tableau Online**](https://www.tableau.com/products/online/request-trial)

In this event, data from Salesforce will be replicated with Fivetran into Snowflake, where an analytical data model will be applied. Data will then be visualized in Tableau dashboards.

    Salesforce data -> Fivetran replication -> Snowflake warehouse -> Tableau dashboards

## Provisioning

- Salesforce Developer Account: https://developer.salesforce.com Free account, no credit card
- Snowflake Trial: [https://trial.snowflake.com](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data) $400 free credits
- Fivetran Trial: *Sign up through Snowflake Partner Connect inside Snowflake*
- Tableau Online Trial: [https://www.tableau.com/partner-trial](https://www.tableau.com/products/online/request-trial) 14 days, no credit card

# Source Setup - Salesforce

To connect pull data from Salesforce there are two options:

1. **EXISTING ACCOUNT**: Use your active Salesforce account. The Salesforce account plan level must be Enterprise or higher OR have purchased API calls.
2. **DEVELOPER ACCOUNT**: Sign up for a new **free** Salesforce developer account. Developer accounts come with mock data but have free API calls. Sign up at https://developer.salesforce.com/.

# Warehouse Setup - Snowflake

1. Sign up for a Snowflake Trial with $400 credit at [https://trial.snowflake.com](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data).
2. An email will come within 15 minutes when your Snowflake account is ready.
3. Once you receive the email, login to your Snowflake account.

# Pipeline Setup - Fivetran

## Via Partner Connect

1. In Snowflake, click the user menu (top right corner) → Switch Role → Select ACCOUNTADMIN.
2. Click the **Partner Connect** tab.
3. Choose the Fivetran option and click **Connect**. This will initiate an automatic process to create a partner trial account in Fivetran that will connect to Snowflake.
4. Click **Activate** in the final step.
5. Look for an email from Fivetran and complete the sign up.
6. In the Fivetran Dashboard, click **Connectors**.
7. Click **+ CONNECTOR** and search for *Salesforce*.
8. Click Salesforce and change the schema name to  `salesforce_cpd`. **It is very important** for the Tableau Dashboard section later to have it be named exactly `salesforce_cpd`.
9. Click **AUTHORIZE** and complete the login of Fivetran into Salesforce.
10. Click **SAVE & TEST**. When the tests are completed, click **< View Connector**.
11. Fivetran will download a list of objects available for sync from Salesforce.
12. Under the **Schemas** header click the `-` button just to the left of the **Sync Table** header. We only need a few tables, and this will remove every table from the sync. Then go through the list of objects and add back just the necessary tables, which are `Account`, `Lead`, `Opportunity`, and `User`.
13. In the upper right, click the slider to **Enable** the sync of data from Salesforce into Snowflake.
14. Above the list of tables, change **Replication Frequency** slider over to `24h`. This will kick off an initial sync of historical data.

# Warehouse Configuration: Dimensional Model in Snowflake

There are two analytical processes that we will perform to add value to Salesforce data:

1. **Data Modeling** to reshape our normalized Salesforce data into a useful format for analytics.
2. **Dashboard Design** to effectively design appealing dashboards to see and understand data, in a way that drives action.

Tableau often requires a simplified dataset that is in a single table or star schema. In our example, this will take the form of a dimensional model that we can install. A sample dimensional model is available in this repository at `/model.sql` or https://github.com/DecisiveData/CloudPlusData/blob/master/model.sql.

1. In Snowflake, click **Worksheets** and open a blank worksheet.
2. Copy/paste the contents of `/model.sql` into the blank worksheet in Snowflake.
3. At the top of the worksheet, check the box for **All Queries** and then click the **Run** button.

# Analytics Setup - Tableau Online

1. A Tableau free trial can be created at [https://www.tableau.com/products/online/request-trial](https://www.tableau.com/products/online/request-trial).
2. Fill out the registration form, then wait briefly for Tableau to provision.

## Snowflake ODBC Driver for Tableau Desktop

If you need Tableau Desktop, connects to Snowflake using an ODBC driver that must be installed as a pre-requisite.

1. In Snowflake, click the **Help** icon in the upper right and click the **Download...** option.
2. On the left menu, select **ODBC Driver** and download the appropriate ODBC driver for your operating system and on Windows the appropriate bitness (x86 or x64).
3. Once the ODBC driver is downloaded, complete the install process on your local computer.

# Analytics Configuration - Tableau Online

1. Go to Tableau Online https://online.tableau.com/#/signin
2. Click on **Create Workbook**
3. Go to the **Connectors** tab and connect to **Snowflake**
4. Fill in the server, username, and passoword

# Cost Management

If you do not want your Fivetran data pipeline to continue to burn Snowflake credits, please remember to log back into Fivetran and **Pause** your connector.

# Sample Login Information

The password is the same for the below example accounts. Ask a leader for it.

## Salesforce Developer Logins

- URL: https://login.salesforce.com
- User: `cloudplusdata@decisivedata.net`
- User: `cloudplusdata1@decisivedata.net`
- User: `cloudplusdata2@decisivedata.net`

## Snowflake Login

- URL: 
- User: ``
- Warehouse: ``
- Database: `PC_FIVETRAN_DB`
- Schema: `SALESFORCE_CPD`

## Fivetran Login

- URL: https://fivetran.com/dashboard

# Other Information

## Additional Salesforce Dummy Data

The *Populate Salesforce* application can create additional realistic data beyond what the Salesforce Developer Edition installs for you. Install it from here: https://appexchange.salesforce.com/listingDetail?listingId=a0N3A00000EO5smUAD