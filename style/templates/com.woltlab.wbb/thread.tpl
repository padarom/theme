{include file='documentHeader'}

<head>
	<title>{$thread->topic} {if $pageNo > 1}- {lang}wcf.page.pageNo{/lang} {/if} - {$board->title|language} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	{if $pageNo < $pages}
		<link rel="next" href="{link application='wbb' controller='Thread' object=$thread}pageNo={@$pageNo+1}{/link}" />
	{/if}
	{if $pageNo > 1}
		<link rel="prev" href="{link application='wbb' controller='Thread' object=$thread}{if $pageNo > 2}pageNo={@$pageNo-1}{/if}{/link}" />
	{/if}
	<link rel="canonical" href="{link application='wbb' controller='Thread' object=$thread}{if $pageNo > 1}pageNo={@$pageNo}{/if}{/link}" />
	
	<script data-relocate="true" src="{@$__wcf->getPath()}js/WCF.Infraction{if !ENABLE_DEBUG_MODE}.min{/if}.js?v={@LAST_UPDATE_TIME}"></script>
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wbb.post.closed': '{lang}wbb.post.closed{/lang}',
				'wbb.post.copy.title': '{lang}wbb.post.copy.title{/lang}',
				'wbb.post.edit': '{lang}wbb.post.edit{/lang}',
				'wbb.post.edit.close': '{lang}wbb.post.edit.close{/lang}',
				'wbb.post.edit.delete': '{lang}wbb.post.edit.trash{/lang}',
				'wbb.post.edit.delete.confirmMessage': '{lang}wbb.post.edit.delete.confirmMessage{/lang}',
				'wbb.post.edit.deleteCompletely': '{lang}wbb.post.edit.delete{/lang}',
				'wbb.post.edit.enable': '{lang}wbb.post.edit.enable{/lang}',
				'wbb.post.edit.disable': '{lang}wbb.post.edit.disable{/lang}',
				'wbb.post.edit.merge': '{lang}wbb.post.edit.merge{/lang}',
				'wbb.post.edit.merge.success': '{lang}wbb.post.edit.merge.success{/lang}',
				'wbb.post.edit.open': '{lang}wbb.post.edit.open{/lang}',
				'wbb.post.edit.restore': '{lang}wbb.post.edit.restore{/lang}',
				'wbb.post.edit.trash.confirmMessage': '{lang}wbb.post.edit.trash.confirmMessage{/lang}',
				'wbb.post.edit.trash.reason': '{lang}wbb.post.edit.trash.reason{/lang}',
				'wbb.post.ipAddress.title': '{lang}wbb.post.ipAddress.title{/lang}',
				'wbb.post.moderation.redirect': '{lang}wbb.post.moderation.redirect{/lang}',
				'wbb.post.moveToNewThread': '{lang}wbb.post.moveToNewThread{/lang}',
				'wbb.thread.closed': '{lang}wbb.thread.closed{/lang}',
				'wbb.thread.confirmDelete': '{lang}wbb.thread.confirmDelete{/lang}',
				'wbb.thread.confirmTrash': '{lang}wbb.thread.confirmTrash{/lang}',
				'wbb.thread.confirmTrash.reason': '{lang}wbb.thread.confirmTrash.reason{/lang}',
				'wbb.thread.edit.advanced': '{lang}wbb.thread.edit.advanced{/lang}',
				'wbb.thread.edit.close': '{lang}wbb.thread.edit.close{/lang}',
				'wbb.thread.edit.delete': '{lang}wbb.thread.edit.delete{/lang}',
				'wbb.thread.edit.done': '{lang}wbb.thread.edit.done{/lang}',
				'wbb.thread.edit.enable': '{lang}wbb.thread.edit.enable{/lang}',
				'wbb.thread.edit.disable': '{lang}wbb.thread.edit.disable{/lang}',
				'wbb.thread.edit.move': '{lang}wbb.thread.edit.move{/lang}',
				'wbb.thread.edit.moveDestination.error.equalsOrigin': '{lang}wbb.thread.edit.moveDestination.error.equalsOrigin{/lang}',
				'wbb.thread.edit.open': '{lang}wbb.thread.edit.open{/lang}',
				'wbb.thread.edit.removeLink': '{lang}wbb.thread.edit.removeLink{/lang}',
				'wbb.thread.edit.restore': '{lang}wbb.thread.edit.restore{/lang}',
				'wbb.thread.edit.scrape': '{lang}wbb.thread.edit.scrape{/lang}',
				'wbb.thread.edit.sticky': '{lang}wbb.thread.edit.sticky{/lang}',
				'wbb.thread.edit.trash': '{lang}wbb.thread.edit.trash{/lang}',
				'wbb.thread.edit.undone': '{lang}wbb.thread.edit.undone{/lang}',
				'wbb.thread.moved': '{lang}wbb.thread.moved{/lang}',
				'wbb.thread.newPosts': '{lang}wbb.thread.newPosts{/lang}',
				'wbb.thread.sticky': '{lang}wbb.thread.sticky{/lang}',
				'wcf.global.worker.completed': '{lang}wcf.global.worker.completed{/lang}',
				'wcf.user.objectWatch.manageSubscription': '{lang}wcf.user.objectWatch.manageSubscription{/lang}',
				'wcf.message.bbcode.code.copy': '{lang}wcf.message.bbcode.code.copy{/lang}',
				'wcf.message.error.editorAlreadyInUse': '{lang}wcf.message.error.editorAlreadyInUse{/lang}',
				'wcf.message.share': '{lang}wcf.message.share{/lang}',
				'wcf.message.share.permalink': '{lang}wcf.message.share.permalink{/lang}',
				'wcf.message.share.permalink.bbcode': '{lang}wcf.message.share.permalink.bbcode{/lang}',
				'wcf.message.share.permalink.html': '{lang}wcf.message.share.permalink.html{/lang}',
				'wcf.moderation.report.reportContent': '{lang}wcf.moderation.report.reportContent{/lang}',
				'wcf.moderation.report.success': '{lang}wcf.moderation.report.success{/lang}',
				'wcf.infraction.warn': '{lang}wcf.infraction.warn{/lang}',
				'wcf.infraction.warn.success': '{lang}wcf.infraction.warn.success{/lang}',
				'wbb.thread.edit.moveThreads': '{lang}wbb.thread.edit.moveThreads{/lang}',
				'wbb.thread.edit': '{lang}wbb.thread.edit{/lang}',
				'wcf.label.none': '{lang}wcf.label.none{/lang}',
				'wbb.thread.done': '{lang}wbb.thread.done{/lang}',
				'wbb.thread.undone': '{lang}wbb.thread.undone{/lang}'
			});
			
			{if $__wcf->user->userID && $thread->canReply()}
				{assign var='supportPaste' value=true}
			{else}
				{assign var='supportPaste' value=false}
			{/if}
			{include file='__messageQuoteManager' wysiwygSelector='text'}
			new WBB.Post.QuoteHandler($quoteManager);
			
			var $collapsedPostLoader = null;
			{if $board->getModeratorPermission('canReadDeletedPost')}
				$collapsedPostLoader = new WBB.Post.CollapsedPostLoader('.wbbPostDeleted');
			{/if}
			
			{if MODULE_LIKE && $__wcf->getSession()->getPermission('user.like.canViewLike')}new WBB.Post.Like({if $__wcf->getUser()->userID && $board->getPermission('canLikePost')}1{else}0{/if}, {@LIKE_ENABLE_DISLIKE}, {@LIKE_SHOW_SUMMARY}, {@LIKE_ALLOW_FOR_OWN_CONTENT});{/if}
			{if $__wcf->user->userID}
				var $postHandler = new WBB.Post.Handler('.wbbPost');
				new WBB.Post.InlineEditor({@$thread->threadID}, $postHandler, $quoteManager);
				
				if ($collapsedPostLoader) {
					$collapsedPostLoader.setPostHandler($postHandler);
				}
				
				var $updateHandler = new WBB.Thread.UpdateHandler.Thread({@$board->boardID});
				$postHandler.setThreadUpdateHandler($updateHandler);
				$updateHandler.setPostHandler($postHandler);
				{if WBB_MODULE_THREAD_MARKING_AS_DONE && $board->enableMarkingAsDone}
					new WBB.Thread.MarkAsDone($updateHandler);
				{/if}
				
				{if $thread->canEdit()}
					var $inlineEditor = new WBB.Thread.InlineEditor('.jsThreadInlineEditorContainer');
					$inlineEditor.setUpdateHandler($updateHandler);
					$inlineEditor.setEnvironment('thread', {@$board->boardID});
					$inlineEditor.setPermissions({
						canCloseThread: {if $board->getModeratorPermission('canCloseThread')}true{else}false{/if},
						canDeleteThread: {if $board->getModeratorPermission('canDeleteThread')}true{else}false{/if},
						canDeleteThreadCompletely: {if $board->getModeratorPermission('canDeleteThreadCompletely')}true{else}false{/if},
						canEnableThread: {if $board->getModeratorPermission('canEnableThread')}true{else}false{/if},
						canMoveThread: {if $board->getModeratorPermission('canMoveThread')}true{else}false{/if},
						canPinThread: {if $board->getModeratorPermission('canPinThread')}true{else}false{/if},
						canRestoreThread: {if $board->getModeratorPermission('canRestoreThread')}true{else}false{/if}
					});
				{/if}
				
				{if $board->canEditThreads() || $thread->getBoard()->getModeratorPermission('canClosePost') || $thread->getBoard()->getModeratorPermission('canDeletePost') || $thread->getBoard()->getModeratorPermission('canDeletePostCompletely') || $thread->getBoard()->getModeratorPermission('canEnablePost') || $thread->getBoard()->getModeratorPermission('canRestorePost')}
					{assign var='canEditPostInline' value=true}
					var $postClipboardHandler = new WBB.Post.Clipboard($postHandler);
					$postClipboardHandler.setThreadUpdateHandler($updateHandler);
				{else}
					{assign var='canEditPostInline' value=false}
				{/if}
			{/if}
			
			{if $isLastPage && $sortOrder == 'ASC'}new WBB.Thread.LastPageHandler({@$thread->threadID}, {@$objects->getMaxPostTime()}, {@$pageNo});{/if}
			
			{if LOG_IP_ADDRESS && $__wcf->session->getPermission('admin.user.canViewIpAddress')}new WBB.Post.IPAddressHandler();{/if}
			
			{if $__wcf->getUser()->userID && $thread->canReply()}new WBB.Thread.QuickReply($quoteManager);{/if}
			
			WCF.Clipboard.init('wbb\\page\\ThreadPage', {@$hasMarkedItems}, { }, {$thread->threadID});
			
			{if $__wcf->session->getPermission('user.profile.canReportContent')}
				new WCF.Moderation.Report.Content('com.woltlab.wbb.post', '.jsReportPost');
			{/if}
			
			{if MODULE_USER_INFRACTION && $__wcf->session->getPermission('mod.infraction.warning.canWarn')}
				new WCF.Infraction.Warning.Content('com.woltlab.wbb.warnablePost', '.jsWarnPost');
			{/if}
			
			new WCF.User.ObjectWatch.Subscribe();
			new WCF.Message.Share.Content();
			new WCF.Message.BBCode.CodeViewer();
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{capture assign='headerNavigation'}
	{if $__wcf->user->userID}
		<li class="jsOnly"><a href="#" title="{lang}wcf.user.objectWatch.manageSubscription{/lang}" class="jsSubscribeButton jsTooltip" data-object-type="com.woltlab.wbb.thread" data-object-id="{@$thread->threadID}" data-is-subscribed="{if $thread->isSubscribed()}true{else}false{/if}"><span class="icon icon16 icon-bookmark{if !$thread->isSubscribed()}-empty{/if}"></span> <span class="invisible">{lang}wcf.user.objectWatch.manageSubscription{/lang}</span></a></li>
	{/if}
	{if $board->canEditThreads()}
		<li><a href="{link application='wbb' controller='ThreadLog' id=$thread->threadID}{/link}" title="{lang}wbb.thread.log{/lang}" class="jsTooltip"><span class="icon icon16 icon-tasks"></span> <span class="invisible">{lang}wbb.thread.log{/lang}</span></a></li>
	{/if}
{/capture}

{include file='header' title=$thread->topic light=true}

<div class="container">
	{*
		<header class="boxHeadline marginTop wbbThread labeledHeadline" data-thread-id="{@$thread->threadID}"{if $thread->canEdit()} data-is-closed="{@$thread->isClosed}" data-is-deleted="{@$thread->isDeleted}" data-is-disabled="{@$thread->isDisabled}" data-is-sticky="{@$thread->isSticky}" data-is-announcement="{@$thread->isAnnouncement}"{/if}{if WBB_MODULE_THREAD_MARKING_AS_DONE && $board->enableMarkingAsDone} data-is-done="{@$thread->isDone}" data-can-mark-as-done="{if $thread->canMarkAsDone()}1{else}0{/if}"{/if} data-is-link="{if $thread->movedThreadID}1{else}0{/if}">
			<h1>
				{if $thread->isSticky}<span class="badge label jsSticky">{lang}wbb.thread.sticky{/lang}</span>{/if}
				{if $thread->isAnnouncement}<span class="badge badgeUpdate label jsIconAnnouncement">{lang}wbb.thread.announcement{/lang}</span>{/if}
				{event name='topicBadges'}
				<a href="{link application='wbb' controller='Thread' object=$thread}{/link}">{$thread->topic}</a>
			</h1>

			{hascontent}
				<ul class="statusIcons">
					{content}
						{if $thread->isClosed}<li><span class="icon icon16 icon-lock jsTooltip jsIconClosed" title="{lang}wbb.thread.closed{/lang}"></span></li>{/if}
						{if WBB_MODULE_THREAD_MARKING_AS_DONE && $board->enableMarkingAsDone}
							{if $thread->isDone}
								<li><span id="threadMarking{@$thread->threadID}" class="icon icon16 icon-check jsTooltip jsIconDone wbbMarkAsDone" title="{lang}wbb.thread.done{/lang}"></span></li>
							{else}
								<li><span id="threadMarking{@$thread->threadID}" class="icon icon16 icon-check-empty jsTooltip jsIconUndone wbbMarkAsDone" title="{lang}wbb.thread.undone{/lang}"></span></li>
							{/if}
						{/if}
					{/content}
				</ul>
			{hascontentelse}
				<ul class="statusIcons"></ul>
			{/hascontent}

			{if $thread->hasLabels()}
				<ul class="labelList">
					{foreach from=$thread->getLabels() item=label}
						<li><span class="label badge{if $label->getClassNames()} {$label->getClassNames()}{/if}">{lang}{$label->label}{/lang}</span></li>
					{/foreach}
				</ul>
			{/if}

			{event name='headlineData'}
		</header>
	*}

	{include file='userNotice'}

	{event name='afterUserNotice'}

	{if $thread->isDisabled && !$board->getModeratorPermission('canEnableThread')}
		<p class="alert alert-info">{lang}wbb.thread.moderation.disabledThread{/lang}</p>
	{/if}
	
	<div class="action-bar top clearfix wbbThread" data-thread-id="{@$thread->threadID}"{if $thread->canEdit()} data-is-closed="{@$thread->isClosed}" data-is-deleted="{@$thread->isDeleted}" data-is-disabled="{@$thread->isDisabled}" data-is-sticky="{@$thread->isSticky}" data-is-announcement="{@$thread->isAnnouncement}"{/if}{if WBB_MODULE_THREAD_MARKING_AS_DONE && $board->enableMarkingAsDone} data-is-done="{@$thread->isDone}" data-can-mark-as-done="{if $thread->canMarkAsDone()}1{else}0{/if}"{/if} data-is-link="{if $thread->movedThreadID}1{else}0{/if}">
		<div class="buttons jsThreadInlineEditorContainer" data-thread-id="{@$thread->threadID}" data-is-closed="{@$thread->isClosed}" data-is-sticky="{@$thread->isSticky}" data-is-disabled="{@$thread->isDisabled}">
			{if $thread->isClosed}
				{if $thread->canReply()}
					<a href="{link application='wbb' controller='PostAdd' id=$threadID}{/link}" title="{lang}wbb.post.add{/lang}" class="btn btn-primary jsQuickReply"><i class="fa fa-lock"></i> <span>{lang}wbb.post.button.add{/lang}</span></a>
				{else}
					<div class="btn btn-primary"><i class="fa fa-lock"></i> <span>Closed</span></div>
				{/if}
			{elseif $thread->canReply()}
				<a href="{link application='wbb' controller='PostAdd' id=$threadID}{/link}" title="{lang}wbb.post.add{/lang}" class="btn btn-primary jsQuickReply"><i class="fa fa-reply"></i> <span>{lang}wbb.post.button.add{/lang}</span></a>
			{/if}
			{if $thread->canEdit()}
				<a href="#" class="btn btn-quaternary jsThreadInlineEditor jsOnly"><i class="fa fa-wrench"></i> <span>{lang}wbb.thread.edit{/lang}</span></a>
			{/if}
			
			{event name='contentNavigationButtonsTop'}
		</div>
		<div class="pagination">
			{anamiPages print=true assign=pagesLinks application='wbb' controller='Thread' object=$thread link="pageNo=%d"}
		</div>
	</div>

	<ul class="wbbThreadPostList messageList jsClipboardContainer" data-type="com.woltlab.wbb.post">
		{if $sortOrder == 'DESC' && $thread->canReply()}
			{assign var='tmpAttachmentList' value=$attachmentList}
			{include file='threadQuickReply' application='wbb'}
			{assign var='attachmentList' value=$tmpAttachmentList}
		{/if}
		{if $sortOrder == 'DESC'}{assign var=startIndex value=$items-$startIndex+1}{/if}
		{include file='threadPostList' application='wbb'}
		{if $sortOrder == 'ASC' && $thread->canReply()}{include file='threadQuickReply' application='wbb'}{/if}
	</ul>

	<div class="action-bar bottom clearfix" style="margin-top:21px;">
		<div class="buttons">
			{if $thread->isClosed}
				{if $thread->canReply()}
					<a href="{link application='wbb' controller='PostAdd' id=$threadID}{/link}" title="{lang}wbb.post.add{/lang}" class="btn btn-primary jsQuickReply"><i class="fa fa-lock"></i> <span>{lang}wbb.post.button.add{/lang}</span></a>
				{else}
					<div class="btn btn-primary"><i class="fa fa-lock"></i> <span>Closed</span></div>
				{/if}
			{elseif $thread->canReply()}
				<a href="{link application='wbb' controller='PostAdd' id=$threadID}{/link}" title="{lang}wbb.post.add{/lang}" class="btn btn-primary jsQuickReply"><i class="fa fa-reply"></i> <span>{lang}wbb.post.button.add{/lang}</span></a>
			{/if}
			
			{event name='contentNavigationButtonsBottom'}
		</div>
		<div class="pagination">
			{@$pagesLinks}
		</div>
	</div>
</div>

{hascontent}
	<div class="background-deep below-forums-list">
		<div class="container">
			<div class="containerHeadline row">
				{content}
				
					<div class="{if $similarThreadList && $similarThreadList->getObjects()|count}col-sm-6{else}col-sm-12{/if}">
						{if MODULE_USERS_ONLINE && WBB_THREAD_ENABLE_ONLINE_LIST && $__wcf->session->getPermission('user.profile.canViewUsersOnlineList') && $usersOnlineList->stats[total]}		
							<h3 class="marginBottom big">Who is online</h3>
							<p>
								Users browsing this forum:
								{foreach from=$usersOnlineList->getObjects() item=userOnline}{counter assign='onlineUsers' print=false}{if $onlineUsers > 1}, {/if}<a href="{link controller='User' object=$userOnline->getDecoratedObject()}{/link}" class="userLink" data-user-id="{@$userOnline->userID}">{@$userOnline->getFormattedUsername()}</a>{/foreach}
							</p>
						{/if}

						{if $tags|count}
							<h3 class="marginBottom marginTop big">Tags</h3>
							<p>
								{foreach from=$tags item=tag}
									<a href="{link controller='Tagged' object=$tag}objectType=com.woltlab.wbb.thread{/link}" class="label label-default jsTooltip" style="margin-right: 8px;" title="{lang}wcf.tagging.taggedObjects.com.woltlab.wbb.thread{/lang}">{$tag->name}</a>
								{/foreach}
							</p>
						{/if}
						
						{event name='infoBoxes'}
					</div>

					{if $similarThreadList && $similarThreadList->getObjects()|count}
						<div class="col-sm-6">
							<h3 class="marginBottom big">{lang}wbb.thread.similarThreads{/lang}</h3>
								<ul class="containerBoxList tripleColumned">
									{foreach from=$similarThreadList item=similarThread}
										<li>
											<div class="box48">
												<a href="{link application='wbb' controller='Thread' object=$similarThread}{/link}" title="{@$similarThread->username}" class="framed">{@$similarThread->getUserProfile()->getAvatar()->getImageTag(48)}</a>

												<div>
													<p>
														<a href="{link application='wbb' controller='Thread' object=$similarThread}{/link}" {if $similarThread->getBoard()->getPermission('canReadThread')} class="wbbTopicLink"{/if} data-thread-id="{@$similarThread->threadID}">{$similarThread->topic}</a>
													</p>
													<p><small>
														{if $similarThread->userID}<a href="{link controller='User' object=$similarThread->getUserProfile()}{/link}" class="userLink" data-user-id="{@$similarThread->userID}">{$similarThread->username}</a>{else}{$similarThread->username}{/if}
														- {@$similarThread->time|time}
													</small></p>
													<p><small>
														<a href="{link application='wbb' controller='Board' object=$similarThread->getBoard()}{/link}">{$similarThread->getBoard()->title|language}</a>
													</small></p>
												</div>
											</div>
										</li>
									{/foreach}
								</ul>
							</div>
						{/if}

				{/content}
			</div>
		</div>
	</div>
{/hascontent}

{include file='footer' skipBreadcrumbs=false}

</body>
</html>
