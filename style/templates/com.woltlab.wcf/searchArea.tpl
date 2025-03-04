{capture assign='__searchFormLink'}{link controller='Search'}{/link}{/capture}
{capture assign='__searchInputPlaceholder'}{lang}wcf.global.search.enterSearchTerm{/lang}{/capture}
{capture assign='__searchDropdownOptions'}<label><input type="checkbox" name="subjectOnly" value="1" /> {lang}wcf.search.subjectOnly{/lang}</label>{/capture}
{assign var='__searchHiddenInputFields' value=''}

{event name='settings'}

<aside id="search" class="searchBar dropdown hidden-xs" data-disable-auto-focus="true">
	<form method="post" action="{@$__searchFormLink}">
        <div class="input-group">
			<input type="search" name="q" placeholder="{@$__searchInputPlaceholder}" autocomplete="off" required="required" value="{if $query|isset}{$query}{/if}" class="dropdownToggle form-control" data-toggle="search" />
		
			<ul class="dropdownMenu">
				{hascontent}
					<li class="dropdownText">
						{content}
							{@$__searchDropdownOptions}
						{/content}
					</li>
					<li class="dropdownDivider"></li>
				{/hascontent}
				<li><a href="{@$__searchFormLink}">{lang}wcf.search.extended{/lang}</a></li>
			</ul>
			
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
		
		{@$__searchHiddenInputFields}
		{@SECURITY_TOKEN_INPUT_TAG}
	</form>
</aside>

{if !OFFLINE || $__wcf->session->getPermission('admin.general.canViewPageDuringOfflineMode')}
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			new WCF.Search.Message.SearchArea($('#search'));
		});
		//]]>
	</script>
{/if}