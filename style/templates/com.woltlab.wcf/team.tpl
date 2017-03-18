{include file='documentHeader'}

<head>
	<title>{lang}wcf.user.team{/lang} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<link rel="canonical" href="{link controller='Team'}{/link}" />
	
	<script data-relocate="true">
		//<![CDATA[
			$(function() {
				WCF.Language.addObject({
					'wcf.user.button.follow': '{lang}wcf.user.button.follow{/lang}',
					'wcf.user.button.ignore': '{lang}wcf.user.button.ignore{/lang}',
					'wcf.user.button.unfollow': '{lang}wcf.user.button.unfollow{/lang}',
					'wcf.user.button.unignore': '{lang}wcf.user.button.unignore{/lang}'
				});
				
				new WCF.User.Action.Follow($('.userList > li'));
				new WCF.User.Action.Ignore($('.userList > li'));
			});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{capture assign='sidebar'}
	{@$__boxSidebar}
{/capture}

{include file='header' sidebarOrientation='right' title='wcf.user.team'|language light=true}

<div class="container">
	{include file='userNotice'}
</div>

<div class="contentNavigation">
	{hascontent}
		<nav>
			<ul>
				{content}
					{event name='contentNavigationButtonsTop'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

<div class="container">
	<div class="row">
		<div class="tabs">
			<ul class="nav nav-tabs">
				{foreach from=$objects->getTeams() item=team key=key}
					{counter assign='count' name='headers'}
					<li {if $count == 1}class="active"{/if}>
						<a href="#team-{$count}" data-toggle="tab">{$team->groupDescription|language}</a>
					</li>
				{/foreach}
			</ul>
			<div class="tab tab-content">
				{$objects->rewind()}
				{foreach from=$objects->getTeams() item=team key=key}
					{counter assign='count' name='bodies'}
					<div id="team-{$count}" class="tab-pane {if $count == 1}active{/if}">
						<h3 class="big marginBottom">{$team->groupDescription|language} <span class="badge">{#$team->getMembers()|count}</span></h3>

						<ol class="containerList userList">
							{foreach from=$team->myGetMembers() item=user}
								{include file='userListItem'}
							{/foreach}
						</ol>
					</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>

<div class="contentNavigation">
	{hascontent}
		<nav>
			<ul>
				{content}
					{event name='contentNavigationButtonsBottom'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

{include file='footer'}

</body>
</html>
