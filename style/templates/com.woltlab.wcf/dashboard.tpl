{include file='documentHeader'}

<head>
	<title>{if $__wcf->getPageMenu()->getLandingPage()->menuItem != 'wcf.user.dashboard'}{lang}wcf.user.dashboard{/lang} - {/if}{PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<link rel="canonical" href="{link controller='Dashboard'}{/link}" />
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

	{if $__boxSidebar|isset && $__boxSidebar}
		{capture assign='sidebar'}
			{@$__boxSidebar}
		{/capture}
	{/if}

	{capture assign='__pageTitle'}
		{if $__wcf->getPageMenu()->getLandingPage()->menuItem == 'wcf.user.dashboard'}
			{PAGE_TITLE|language}
			{hascontent} - {content}{PAGE_DESCRIPTION|language}{/content}{/hascontent}
		{else}
			{lang}wcf.user.dashboard{/lang}
		{/if}
	{/capture}
	
	{include file='header' sidebarOrientation='right' title=$__pageTitle light=true paddingBottom=30}

	<div class="container">
		{include file='userNotice'}

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

		<section id="dashboard">
			{if $__boxContent|isset}{@$__boxContent}{/if}
		</section>

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
	</div>

	{include file='footer' skipBreadcrumbs=true}
</body>
</html>
