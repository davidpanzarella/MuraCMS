﻿<cfset rsCheck=dbTableColumns("tsettings")>

<cfquery name="rsCheck" dbtype="query">
	select * from rsCheck where lower(rsCheck.column_name) like 'baseid'
</cfquery>

<cfif not rsCheck.recordcount>
<cfswitch expression="#getDbType()#">
	<cfcase value="mssql">
		<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
		ALTER TABLE tsettings ADD baseID [char](35) default NULL
		</cfquery>
	</cfcase>
	<cfcase value="mysql">
		<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
		ALTER TABLE tsettings ADD COLUMN baseID char(35) default NULL
		</cfquery>
	</cfcase>
	<cfcase value="oracle">
		<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
		ALTER TABLE tsettings ADD baseID char(35)
		</cfquery>
	</cfcase>
	</cfswitch>

	<cfquery name="rsCheck" datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
		select siteID from tsettings
	</cfquery>

	<cfloop query="rsCheck">
		<cfquery datasource="#getDatasource()#" username="#getDBUsername()#" password="#getDbPassword()#">
		update tsettings set 
			baseID=<cfqueryparam cfsqltype="cf_sql_varchar" value="#createUUID()#">
		where siteID=<cfqueryparam cfsqltype="cf_sql_varchar" value="#rsCheck.siteID#">
	</cfquery>
	</cfloop>
</cfif>

