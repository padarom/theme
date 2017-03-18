{include file='documentHeader'}

<head>
	<title>{lang}wbb.post.add{/lang} - {$thread->topic} - {$board->title|language} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wcf.message.bbcode.code.copy': '{lang}wcf.message.bbcode.code.copy{/lang}'
			});
			
			/*new WBB.Post.Add.Notification({$thread->threadID}, {$thread->replies});*/
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
{include file='header' title='wbb.post.add'|language light=true}

<div class="container">
	{include file='userNotice'}

	{if !$board->getPermission('canReplyThreadWithoutModeration')}
		<p class="alert alert-info">{lang}wbb.post.moderation.info{/lang}</p>
	{/if}

	{if WBB_REPLY_OLD_THREAD_WARNING && ($thread->lastPostTime < (TIME_NOW - 86400 * WBB_REPLY_OLD_THREAD_WARNING))}
		<p class="alert alert-warning">{lang}wbb.thread.oldThread{/lang}</p>
	{/if}

	{if $thread->isClosed}
		<p class="alert alert-warning">{lang}wbb.thread.closedThread{/lang}</p>
	{/if}

	{include file='formError'}
</div>

<form id="messageContainer" class="jsFormGuard" method="post" action="{link application='wbb' controller='PostAdd' id=$threadID}{/link}">
	<div class="container containerPadding marginTop">
		<fieldset>
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
			
			{if $board->getModeratorPermission('canEnablePost')}
				<dl>
					<dt></dt>
					<dd>
						<label><input type="checkbox" id="disablePost" name="disablePost" value="1" {if $disablePost}checked="checked" {/if}{if $thread->isDisabled} disabled="disabled"{/if}/> {lang}wbb.post.disablePost{/lang}</label>
					</dd>
				</dl>
				
				<dl{if $errorField == 'enableTime'} class="formError"{/if}{if !$disablePost} style="display: none"{/if}>
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
						$('#disablePost').click(function() {
							$('#enableTime').parents('dl:eq(0)').toggle();
						});
					});
					//]]>
				</script>
			{/if}
			
			{event name='informationFields'}
		</fieldset>
		
		{include file='captcha'}
		
		{event name='beforeMessageFieldset'}
		
		<fieldset>
			<legend>{lang}wbb.post.message{/lang}</legend>
				
			<dl class="wide{if $errorField == 'text'} formError{/if}">
				<dt><label for="text">{lang}wbb.post.message{/lang}</label></dt>
				<dd>
					<textarea id="text" name="text" rows="20" cols="40" data-autosave="com.woltlab.wbb.postAdd-{@$thread->threadID}">{$text}</textarea>
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
		
		{event name='fieldsets'}
		
		<div class="text-center marginTop">
			<button type="submit" class="btn btn-primary btn-3d">{lang}wcf.global.button.submit{/lang}</button>
			{include file='messageFormPreviewButton'}
			{@SECURITY_TOKEN_INPUT_TAG}
		</div>
	</div>
</form>

<div class="background-deep below-forums-list">
	<div class="containerList infoBoxList">
		<div class="container">

			<header>
				<h3 class="big marginBottom">{lang}wbb.post.previousPosts{/lang}{if $items != 1} <span class="badge">{#$items}</span>{/if}</h3>
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
			
		</div>
	</div>
</div>

{include file='footer'}
{include file='wysiwyg'}

</body>
</html>
