﻿ <!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfsilent>
	<cfset request.layout=false>
	<cfparam name="rc.layoutmanager" default="false">
	<cfparam name="rc.container" default="">
	<cfparam name="rc.contentid" default="">
	<cfparam name="rc.parentid" default="">
	<cfparam name="rc.contenthistid" default="">
	<cfparam name="rc.objectid" default=""/>
	<cfset contentRendererUtility=rc.$.getBean('contentRendererUtility')>
</cfsilent>

<cfswitch expression="#rc.classid#">	
	<cfcase value="feed">
		<cfinclude template="objectclass/dsp_feed_configurator.cfm">
	</cfcase>
	<cfcase value="feed_slideshow">
		<cfinclude template="objectclass/dsp_slideshow_configurator.cfm">
	</cfcase>
	<cfcase value="category_summary">
		<cfif application.configBean.getValue(property='allowopenfeeds',defaultValue=false)>
			<cfinclude template="objectclass/dsp_category_summary_configurator.cfm">
		<cfelse>
			<cfinclude template="objectclass/dsp_navigation_configurator.cfm">
		</cfif>
	</cfcase>
	<cfcase value="related_content,related_section_content">
		<cfinclude template="objectclass/dsp_related_content_configurator.cfm">
	</cfcase>
	<cfcase value="tag_cloud">
		<cfinclude template="objectclass/dsp_tagcloud_configurator.cfm">
	</cfcase>
	<cfcase value="site_map">
		<cfinclude template="objectclass/dsp_sitemap_configurator.cfm">
	</cfcase>
	<cfcase value="form,form_responses">
		<cfinclude template="objectclass/dsp_form_configurator.cfm">
	</cfcase>
	<cfcase value="component">
		<cfinclude template="objectclass/dsp_component_configurator.cfm">
	</cfcase>
	<cfcase value="folder">
		<cfinclude template="objectclass/dsp_folder_configurator.cfm">
	</cfcase>
	<cfcase value="plugin">
		<cfinclude template="objectclass/dsp_plugin_configurator.cfm">
	</cfcase>
	<cfcase value="system,comments,favorites,forward_email,event_reminder_form,rater,payPalCart,user_tools,goToFirstChild">
		<cfinclude template="objectclass/dsp_system_configurator.cfm">
	</cfcase>
	<cfcase value="navigation,sub_nav,peer_nav,standard_nav,portal_nav,folder_nav,multilevel_nav,seq_nav,top_nav,calendar_nav,archive_nav">
		<cfinclude template="objectclass/dsp_navigation_configurator.cfm">
	</cfcase>
	<cfcase value="mailing_list,mailing_list_master">
		<cfinclude template="objectclass/dsp_mailinglist_configurator.cfm">
	</cfcase>
	<cfcase value="container">
		<cfinclude template="objectclass/dsp_container_configurator.cfm">
	</cfcase>
	<cfcase value="collection">
		<cfif rc.container eq 'layout'>
			<cfinclude template="objectclass/collection/layout/index.cfm">
		<cfelse>
			<cfinclude template="objectclass/collection/index.cfm">
		</cfif>
	</cfcase>
	<cfcase value="text">
		<cfinclude template="objectclass/dsp_text_configurator.cfm">
	</cfcase>
	<cfcase value="media">
		<cfinclude template="objectclass/dsp_media_configurator.cfm">
	</cfcase>
	<cfcase value="socialembed">
		<cfinclude template="objectclass/dsp_socialembed_configurator.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfif rc.$.useLayoutManager()>
			<cf_objectconfigurator></cf_objectconfigurator>
		<cfelse>
			<cfoutput>
				<p class="alert">This display object is not configurable.</p>
			</cfoutput>
		</cfif>	
	</cfdefaultcase>
</cfswitch>