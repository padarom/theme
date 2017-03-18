{include file='documentHeader'}

<head>
	<title>{lang}wbb.thread.add{/lang} - {$board->title|language} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wcf.label.none': '{lang}wcf.label.none{/lang}',
			});
			
			new WCF.Label.Chooser({ {implode from=$labelIDs key=groupID item=labelID}{@$groupID}: {@$labelID}{/implode} }, '#messageContainer');
			{if WBB_THREAD_SHOW_SIMILAR_THREADS_WHEN_CREATING_NEW_THREAD}
				new WBB.Thread.SimilarThreads($('#subject'), {@$board->boardID});
			{/if}
			
			WCF.Message.Submit.registerButton('text', $('#messageContainer > .formSubmit > input[type=submit]'));
			new WCF.Message.FormGuard();
			
			{include file='__messageQuoteManager' wysiwygSelector='text' supportPaste=true}
			
			WCF.System.Dependency.Manager.register('Redactor_text', function() { new WCF.Message.UserMention('text'); });
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">
{include file='header' light=true title='wbb.thread.add'|language}

<div class="container marginBottom-30">
	{include file='userNotice'}

	{if !$board->getPermission('canStartThreadWithoutModeration')}
		<p class="alert alert-info">{lang}wbb.thread.moderation.info{/lang}</p>
	{/if}

	{include file='formError'}

	<form id="messageContainer" class="jsFormGuard" method="post" action="{link application='wbb' controller='ThreadAdd' id=$boardID}{/link}">
		<div class="marginTop">
				{if !$threadForm|isset}{include file='threadTypeSelection' application='wbb'}{/if}
				
				<fieldset {if $threadForm|isset && $__wcf->user->userID}class="hidden"{/if}>
					<legend>{lang}wbb.post.information{/lang}</legend>

					{if !$__wcf->user->userID}
						<dl{if $errorField == 'username'} class="formError"{/if}>
							<dt><label for="username">{lang}wcf.user.username{/lang}</label></dt>
							<dd>
								<input type="text" id="username" name="username" value="{$username}" required="required" class="long" />
								{if $errorField == 'username'}
									<small class="innerError">
										{if $errorType == 'empty'}
											{lang}wcf.global.form.error.empty{/lang}
										{else}
											{lang}wcf.user.username.error.{@$errorType}{/lang}
										{/if}
									</small>
								{/if}
							</dd>
						</dl>
					{/if}

					{event name='afterUsernameField'}

					{if $threadForm|isset}
						<div class="hidden">
					{/if}
					
					{include file='messageFormMultilingualism'}

					{if $labelGroups|count}
						{foreach from=$labelGroups item=labelGroup}
							{if $labelGroup|count}
								<dl{if $errorField == 'label' && $errorType[$labelGroup->groupID]|isset} class="formError"{/if}>
									<dt><label>{$labelGroup}</label></dt>
									<dd>
										<ul class="labelList jsOnly" data-object-id="{@$labelGroup->groupID}">
											<li class="dropdown labelChooser" id="labelGroup{@$labelGroup->groupID}" data-group-id="{@$labelGroup->groupID}" data-force-selection="{if $labelGroup->forceSelection}true{else}false{/if}">
												<div class="dropdownToggle" data-toggle="labelGroup{@$labelGroup->groupID}"><span class="badge label">{lang}wcf.label.none{/lang}</span></div>
												<div class="dropdownMenu">
													<ul class="scrollableDropdownMenu">
														{foreach from=$labelGroup item=label}
															<li data-label-id="{@$label->labelID}"><span><span class="badge label{if $label->getClassNames()} {@$label->getClassNames()}{/if}">{lang}{$label->label}{/lang}</span></span></li>
														{/foreach}
													</ul>
												</div>
											</li>
										</ul>
										<noscript>
											<select name="labelIDs[{@$labelGroup->groupID}]">
												{foreach from=$labelGroup item=label}
													<option value="{@$label->labelID}">{lang}{$label->label}{/lang}</option>
												{/foreach}
											</select>
										</noscript>
										{if $errorField == 'label' && $errorType[$labelGroup->groupID]|isset}
											<small class="innerError">
												{if $errorType[$labelGroup->groupID] == 'missing'}
													{lang}wcf.label.error.missing{/lang}
												{else}
													{lang}wcf.label.error.notValid{/lang}
												{/if}
											</small>
										{/if}
									</dd>
								</dl>
							{/if}
						{/foreach}
					{/if}

					<dl{if $errorField == 'subject'} class="formError"{/if}>
						<dt><label for="subject">{lang}wbb.post.subject{/lang}</label></dt>
						<dd>
							<input type="text" id="subject" name="subject" value="{$subject}" required="required" autofocus="autofocus" maxlength="255" class="long" />
							{if $errorField == 'subject'}
								<small class="innerError">
									{if $errorType == 'empty'}
										{lang}wcf.global.form.error.empty{/lang}
									{elseif $errorType == 'censoredWordsFound'}
										{lang}wcf.message.error.censoredWordsFound{/lang}
									{else}
										{lang}wbb.post.subject.error.{@$errorType}{/lang}
									{/if}
								</small>
							{/if}
						</dd>
					</dl>

					{if MODULE_TAGGING && WBB_THREAD_ENABLE_TAGS && $board->getPermission('canSetTags')}{include file='tagInput'}{/if}

					{if $board->getModeratorPermission('canEnableThread')}
						<dl>
							<dt></dt>
							<dd>
								<label><input type="checkbox" id="disableThread" name="disableThread" value="1" {if $disableThread}checked="checked" {/if}/> {lang}wbb.post.disableThread{/lang}</label>
							</dd>
						</dl>

						<dl{if $errorField == 'enableTime'} class="formError"{/if}{if !$disableThread} style="display: none"{/if}>
							<dt><label for="enableTime">{lang}wbb.post.enableTime{/lang}</label></dt>
							<dd>
								<input type="datetime" id="enableTime" name="enableTime" value="{$enableTime}" class="medium" />
								{if $errorField == 'enableTime'}
									<small class="innerError">
										{if $errorType == 'empty'}
											{lang}wcf.global.form.error.empty{/lang}
										{else}
											{lang}wbb.post.enableTime.error.{@$errorType}{/lang}
										{/if}
									</small>
								{/if}
								<small>{lang}wbb.post.enableTime.description{/lang}</small>
							</dd>
						</dl>

						<script data-relocate="true">
							//<![CDATA[
							$(function() {
								$('#disableThread').click(function() {
									$('#enableTime').parents('dl:eq(0)').toggle();
								});

								$('#messageContainer').submit(function() {
									if (!$('#disableThread').is(':checked')) {
										$('#enableTime').datepicker('destroy');
										$('input[name=enableTime]').val('');
									}
								});
							});
							//]]>
						</script>
					{/if}

					{event name='informationFields'}
					
					{if $threadForm|isset}
						{* Hiddden DIV *}
						</div>
					{/if}
				</fieldset>

			{include file='captcha'}

			{event name='beforeMessageFieldset'}

			{if $threadForm|isset}
				<div class="hidden">
			{/if}
				<fieldset>
					<legend>{lang}wbb.post.message{/lang}</legend>

					<dl class="wide{if $errorField == 'text'} formError{/if}">
						<dt><label for="text">{lang}wbb.post.message{/lang}</label></dt>
						<dd>
							<textarea id="text" name="text" rows="20" cols="40" data-autosave="com.woltlab.wbb.threadAdd-{@$board->boardID}">{$text}</textarea>
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
										{lang}wbb.post.message.error.{@$errorType}{/lang}
									{/if}
								</small>
							{/if}
						</dd>
					</dl>

					{event name='messageFields'}
				</fieldset>

				{include file='messageFormTabs' wysiwygContainerID='text'}
			{if $threadForm|isset}
				{* Hidden DIV *}
				</div>
			{/if}

			{event name='fieldsets'}
		</div>

		<div class="formSubmit">
			<button type="submit" class="btn btn-3d btn-primary">{lang}wcf.global.button.submit{/lang}</button>
			{include file='messageFormPreviewButton'}
			{@SECURITY_TOKEN_INPUT_TAG}
		</div>
	</form>
</div>

{include file='footer'}
{include file='wysiwyg'}

</body>
</html>
