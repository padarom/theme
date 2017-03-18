{include file='documentHeader'}

<head>
	<title>{lang}wcf.user.register.disclaimer{/lang} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{include file='header' __disableAds=true title='wcf.user.register.disclaimer'|language paddingBottom=30 light=true}

<div class="container">
	{include file='userNotice'}
</div>

{include file='formError'}

<div class="contentNavigation">
	{hascontent}
		<nav>
			<ul>
				{content}
					{event name='contentNavigationButtons'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

<form method="post" action="{link controller='Disclaimer'}{/link}">
	<div class="container containerPadding marginTop htmlContent">
		{lang}wcf.user.register.disclaimer.text{/lang}
		
		{event name='fieldsets'}
	
	{if !$__wcf->user->userID}
		<div class="text-center">
			<button type="submit" class="btn btn-primary" name="accept">{lang}wcf.user.register.disclaimer.accept{/lang}</button>
			<a class="btn btn-secondary" href="{link}{/link}">{lang}wcf.user.register.disclaimer.decline{/lang}</a>
			{@SECURITY_TOKEN_INPUT_TAG}
		</div>
	{/if}
	</div>
</form>

{include file='footer' skipBreadcrumbs=true}

</body>
</html>
