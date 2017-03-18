{include file='documentHeader'}

<head>
	<title>{lang}wbb.post.edit{/lang} - {$thread->topic} - {$board->title|language} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wcf.message.bbcode.code.copy': '{lang}wcf.message.bbcode.code.copy{/lang}'
			});
			
			{if $isFirstPost && $labelGroups|count}
				WCF.Language.addObject({
					'wcf.label.none': '{lang}wcf.label.none{/lang}',
				});
				
				new WCF.Label.Chooser({ {implode from=$labelIDs key=groupID item=labelID}{@$groupID}: {@$labelID}{/implode} }, '#messageContainer');
			{/if}
			
			{include file='__messageQuoteManager' wysiwygSelector='text'}
			new WBB.Post.QuoteHandler($quoteManager);
			
			WCF.Message.Submit.registerButton('text', $('#messageContainer > .formSubmit > input[type=submit]'));
			new WCF.Message.FormGuard();
			new WCF.Message.BBCode.CodeViewer();
			
			WCF.System.Dependency.Manager.register('Redactor_text', function() { new WCF.Message.UserMention('text'); });
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">
{include file='header' title='wbb.post.edit'|language light=true}

<div class="container">
	{include file='userNotice'}

	{include file='formError'}
</div>

<form id="messageContainer" class="jsFormGuard" method="post" action="{link application='wbb' controller='PostEdit' id=$postID}{/link}">
	<div class="container containerPadding marginTop">
		{if $post->canDelete() && !$post->isDeleted}
			<fieldset>
				<legend>{lang}wbb.post.delete{/lang}</legend>
				
				<dl>
					<dt></dt>
					<dd><label><input type="checkbox" id="deletePost" name="deletePost" value="1" {if $deletePost == 1}checked="checked" {/if}/> {lang}wbb.post.delete.sure{/lang}</label></dd>
				</dl>
				
				<dl id="deleteReasonDL"{if $errorField == 'deleteReason'} class="formError"{/if}>
					<dt><label for="deleteReason">{lang}wbb.post.deleteReason{/lang}</label></dt>
					<dd>
						<textarea rows="3" cols="40" id="deleteReason" name="deleteReason">{$deleteReason}</textarea>
						{if $errorField == 'deleteReason'}
							<small class="innerError">
								{if $errorType == 'censoredWordsFound'}
									{lang}wcf.message.error.censoredWordsFound{/lang}
								{else}
									{lang}wbb.post.deleteReason.error.{@$errorType}{/lang}
								{/if}
							</small>
						{/if}
					</dd>
				</dl>
			</fieldset>
			
			<script data-relocate="true">
				//<![CDATA[
				$('#deletePost').change(function (event) {
					if ($('#deletePost').is(':checked')) {
						$('#deleteReasonDL').show();
					}
					else {
						$('#deleteReasonDL').hide();
					}
				});
				$('#deletePost').change();
				//]]>
			</script>
		{/if}
		
		{if $isFirstPost}{include file='threadTypeSelection' application='wbb'}{/if}
		
		<fieldset>
			<legend>{lang}wbb.post.information{/lang}</legend>
			
			{if $isFirstPost}
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
			{/if}
			
			<dl{if $errorField == 'subject'} class="formError"{/if}>
				<dt><label for="subject">{lang}wbb.post.subject{/lang}</label></dt>
				<dd>
					<input type="text" id="subject" name="subject" value="{$subject}" maxlength="255" class="long" />
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
			
			{if $isFirstPost && MODULE_TAGGING && WBB_THREAD_ENABLE_TAGS && $board->getPermission('canSetTags')}{include file='tagInput'}{/if}
			
			{if $post->isDisabled && $board->getModeratorPermission('canEnablePost')}
				<dl>
					<dt></dt>
					<dd>
						<label><input type="checkbox" id="disablePost" name="disablePost" value="1" checked="checked" disabled="disabled" /> {lang}wbb.post.disablePost{/lang}</label>
					</dd>
				</dl>
				
				<dl{if $errorField == 'enableTime'} class="formError"{/if}>
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
			{/if}
			
			<dl{if $errorField == 'editReason'} class="formError"{/if}>
				<dt><label for="editReason">{lang}wbb.post.editReason{/lang}</label></dt>
				<dd>
					<textarea rows="3" cols="40" id="editReason" name="editReason">{$editReason}</textarea>
					{if $errorField == 'editReason'}
						<small class="innerError">
							{if $errorType == 'censoredWordsFound'}
								{lang}wcf.message.error.censoredWordsFound{/lang}
							{else}
								{lang}wbb.post.editReason.error.{@$errorType}{/lang}
							{/if}
						</small>
					{/if}
				</dd>
			</dl>
			
			{event name='informationFields'}
		</fieldset>
		
		{event name='beforeMessageFieldset'}
		
		<fieldset>
			<legend>{lang}wbb.post.message{/lang}</legend>
			
			<dl class="wide{if $errorField == 'text'} formError{/if}">
				<dt><label for="text">{lang}wbb.post.message{/lang}</label></dt>
				<dd>
					<textarea rows="20" cols="40" id="text" name="text" data-autosave="com.woltlab.wbb.postEdit-{@$post->postID}" data-autosave-last-edit-time="{@$post->lastEditTime}">{$text}</textarea>
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
		
		{event name='fieldsets'}
		
		{include file='messageFormTabs' wysiwygContainerID='text'}
	</div>
	
	<div class="text-center marginBottom">
		<button type="submit" class="btn btn-primary btn-3d">{lang}wcf.global.button.submit{/lang}</button>
		{include file='messageFormPreviewButton'}
		{@SECURITY_TOKEN_INPUT_TAG}
	</div>
</form>

{if $posts|count}
	<header class="boxHeadline boxSubHeadline">
		<h2>{lang}wbb.post.previousPosts{/lang}{if $items != 1} <span class="badge">{#$items}</span>{/if}</h2>
	</header>
	
	<div>
		<ul class="wbbThreadPostList messageList">
			{foreach from=$posts item=post}
				{assign var='objectID' value=$post->postID}
				
				<li class="marginTop">
					<article class="message messageReduced{if $post->isDeleted} messageDeleted{else if $post->isDisabled} messageDisabled{/if}{if $post->getUserProfile()->userOnlineGroupID} userOnlineGroupMarking{@$post->getUserProfile()->userOnlineGroupID}{/if}" data-object-id="{@$post->postID}">
						<div>
							<section class="messageContent">
								<div>
									<header class="messageHeader">
										<div class="box32">
											{if $post->userID}
												<a href="{link controller='User' object=$post->getUserProfile()}{/link}" class="framed">{@$post->getUserProfile()->getAvatar()->getImageTag(32)}</a>
											{else}
												<span class="framed">{@$post->getUserProfile()->getAvatar()->getImageTag(32)}</span>	
											{/if}
											
											<div class="messageHeadline">
												{if $post->subject}<h1>{$post->subject}</h1>{/if}
												<p>
													<span class="username">{if $post->userID}<a href="{link controller='User' object=$post->getUserProfile()}{/link}">{$post->username}</a>{else}{$post->username}{/if}</span>
													<a href="{link application='wbb' controller='Thread' object=$thread}postID={@$post->postID}{/link}#post{@$post->postID}" class="permalink">{@$post->time|time}</a>
												</p>
											</div>
										</div>
									</header>
									
									<div class="messageBody">
										<div>
											<div class="messageText">
												{@$post->getFormattedMessage()}
											</div>
										</div>
										
										{include file='attachments'}
										
										<footer class="messageOptions">
											<nav class="jsMobileNavigation buttonGroupNavigation">
												<ul class="smallButtons buttonGroup"><li class="toTopLink"><a href="{$__wcf->getAnchor('top')}" title="{lang}wcf.global.scrollUp{/lang}" class="button jsTooltip"><span class="icon icon16 icon-arrow-up"></span> <span class="invisible">{lang}wcf.global.scrollUp{/lang}</span></a></li></ul>
											</nav>
										</footer>
									</div>
								</div>
							</section>
						</div>
					</article>
				</li>
			{/foreach}
		</ul>
	</div>
{/if}

{include file='footer'}
{include file='wysiwyg'}

</body>
</html>
