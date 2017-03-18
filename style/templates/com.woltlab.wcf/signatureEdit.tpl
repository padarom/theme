{include file='documentHeader'}

<head>
	<title>{lang}wcf.user.signature.edit{/lang} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wcf.global.preview': '{lang}wcf.global.preview{/lang}'
			});
			
			new WCF.User.SignaturePreview('wcf\\data\\user\\UserProfileAction', 'text', 'previewButton');
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{include file='userMenuSidebar'}
{include file='header' title='wcf.user.signature.edit'|language}
		
<div class="container marginBottom-30 marginTop">
	<div class="col-md-3 no-padding-left">
		{include file='leftSidebar'}
	</div>
	
	<div class="col-md-9">
		{include file='userNotice'}

		{include file='formError'}

		{if $success|isset}
			<p class="alert alert-success">{lang}wcf.global.success.edit{/lang}</p>
		{/if}

		{if $__wcf->user->disableSignature}
			<p class="alert alert-error">{lang}wcf.user.signature.error.disabled{/lang}</p>
		{/if}

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

		<form method="post" action="{link controller='SignatureEdit'}{/link}">
			<div>
				{if $signatureCache}
					<fieldset>
						<legend>{lang}wcf.user.signature.current{/lang}</legend>

						{@$signatureCache}
					</fieldset>
				{/if}

				{if !$__wcf->user->disableSignature}
					<fieldset id="signatureContainer">
						<legend>{lang}wcf.user.signature{/lang}</legend>

						<dl class="wide{if $errorField == 'text'} formError{/if}">
							<dt><label for="text">{lang}wcf.user.signature{/lang}</label></dt>
							<dd class="no-margin-bottom">
								<textarea id="text" name="text" rows="20" cols="40">{$text}</textarea>
								{if $errorField == 'text'}
									<small class="innerError">
										{if $errorType == 'empty'}
											{lang}wcf.global.form.error.empty{/lang}
										{elseif $errorType == 'tooLong'}
											{lang}wcf.message.error.tooLong{/lang}
										{elseif $errorType == 'censoredWordsFound'}
											{lang}wcf.message.error.censoredWordsFound{/lang}
										{elseif $errorType == 'disallowedBBCodes'}
											{lang}wcf.message.error.disallowedBBCodes{/lang}
										{else}
											{lang}wcf.user.signature.error.{@$errorType}{/lang}
										{/if}
									</small>
								{/if}
							</dd>
						</dl>

						{event name='fields'}
					</fieldset>

					{event name='fieldsets'}

					{include file='messageFormTabs'}
				{/if}
			</div>

			{if !$__wcf->user->disableSignature}
				<div class="formSubmit">
					<button type="submit" class="btn btn-3d btn-primary">{lang}wcf.global.button.submit{/lang}</button>
					<button id="previewButton" class="jsOnly btn btn-3d btn-secondary" accesskey="p">{lang}wcf.global.button.preview{/lang}</button>
					{@SECURITY_TOKEN_INPUT_TAG}
				</div>
			{/if}
		</form>
	</div>
</div>

{include file='footer'}
{include file='wysiwyg'}

</body>
</html>