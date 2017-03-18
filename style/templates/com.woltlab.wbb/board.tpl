{include file='documentHeader'}

<head>
	<title>{$board->title|language} {if $pageNo > 1}- {lang}wcf.page.pageNo{/lang} {/if}- {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	
	{if $board->isBoard()}
		{if $__wcf->getUser()->userID}
			<link rel="alternate" type="application/rss+xml" title="{lang}wcf.global.button.rss{/lang}" href="{link application='wbb' controller='BoardFeed' id=$board->boardID appendSession=false}at={@$__wcf->getUser()->userID}-{@$__wcf->getUser()->accessToken}{/link}" />
		{else}
			<link rel="alternate" type="application/rss+xml" title="{lang}wcf.global.button.rss{/lang}" href="{link application='wbb' controller='BoardFeed' id=$board->boardID appendSession=false}{/link}" />
		{/if}
		
		{assign var='additionalLinkParameters' value=''}
		{if $filterByDate != $defaultFilterByDate}{append var='additionalLinkParameters' value="&filterByDate=$filterByDate"}{/if}
		{if $filterByStatus}{append var='additionalLinkParameters' value="&filterByStatus=$filterByStatus"}{/if}
		{if $labelIDs|count}{capture append='additionalLinkParameters'}{foreach from=$labelIDs key=labelGroupID item=labelID}&labelIDs[{@$labelGroupID}]={@$labelID}{/foreach}{/capture}{/if}
		{if $languageID}{append var='additionalLinkParameters' value="&languageID=$languageID"}{/if}
		{if $tagID}{append var='additionalLinkParameters' value="&tagID=$tagID"}{/if}
		{capture assign='canonicalURLParameters'}{if $sortField != $defaultSortField}&sortField={@$sortField}{/if}{if $sortOrder != $defaultSortOrder}&sortOrder={@$sortOrder}{/if}{@$additionalLinkParameters}{/capture}
		
		{if $pageNo < $pages}
			<link rel="next" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo+1}{@$canonicalURLParameters}{/link}" />
		{/if}
		{if $pageNo > 1}
			<link rel="prev" href="{link application='wbb' controller='Board' object=$board}{if $pageNo > 2}pageNo={@$pageNo-1}{@$canonicalURLParameters}{else}{@$canonicalURLParameters|substr:1}{/if}{/link}" />
		{/if}
		<link rel="canonical" href="{link application='wbb' controller='Board' object=$board}{if $pageNo > 1}pageNo={@$pageNo}{@$canonicalURLParameters}{else}{@$canonicalURLParameters|substr:1}{/if}{/link}" />
	{/if}
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wbb.post.copy.title': '{lang}wbb.post.copy.title{/lang}',
				'wbb.post.moveToNewThread': '{lang}wbb.post.moveToNewThread{/lang}',
				'wbb.thread.closed': '{lang}wbb.thread.closed{/lang}',
				'wbb.thread.confirmDelete': '{lang}wbb.thread.confirmDelete{/lang}',
				'wbb.thread.confirmTrash': '{lang}wbb.thread.confirmTrash{/lang}',
				'wbb.thread.confirmTrash.reason': '{lang}wbb.thread.confirmTrash.reason{/lang}',
				'wbb.thread.copy.title': '{lang __literal=true}wbb.thread.copy.title{/lang}',
				'wbb.thread.done': '{lang}wbb.thread.done{/lang}',
				'wbb.thread.edit.advanced': '{lang}wbb.thread.edit.advanced{/lang}',
				'wbb.thread.edit.assignLabel': '{lang}wbb.thread.edit.assignLabel{/lang}',
				'wbb.thread.edit.close': '{lang}wbb.thread.edit.close{/lang}',
				'wbb.thread.edit.delete': '{lang}wbb.thread.edit.delete{/lang}',
				'wbb.thread.edit.done': '{lang}wbb.thread.edit.done{/lang}',
				'wbb.thread.edit.enable': '{lang}wbb.thread.edit.enable{/lang}',
				'wbb.thread.edit.disable': '{lang}wbb.thread.edit.disable{/lang}',
				'wbb.thread.edit.merge': '{lang}wbb.thread.edit.merge{/lang}',
				'wbb.thread.edit.merge.success': '{lang}wbb.thread.edit.merge.success{/lang}',
				'wbb.thread.edit.move': '{lang}wbb.thread.edit.move{/lang}',
				'wbb.thread.edit.open': '{lang}wbb.thread.edit.open{/lang}',
				'wbb.thread.edit.removeLink': '{lang}wbb.thread.edit.removeLink{/lang}',
				'wbb.thread.edit.restore': '{lang}wbb.thread.edit.restore{/lang}',
				'wbb.thread.edit.scrape': '{lang}wbb.thread.edit.scrape{/lang}',
				'wbb.thread.edit.sticky': '{lang}wbb.thread.edit.sticky{/lang}',
				'wbb.thread.edit.trash': '{lang}wbb.thread.edit.trash{/lang}',
				'wbb.thread.edit.undone': '{lang}wbb.thread.edit.undone{/lang}',
				'wbb.thread.moved': '{lang}wbb.thread.moved{/lang}',
				'wbb.thread.sticky': '{lang}wbb.thread.sticky{/lang}',
				'wbb.thread.undone': '{lang}wbb.thread.undone{/lang}',
				'wbb.thread.edit.moveThreads': '{lang}wbb.thread.edit.moveThreads{/lang}',
				'wbb.thread.edit': '{lang}wbb.thread.edit{/lang}',
				'wcf.global.worker.completed': '{lang}wcf.global.worker.completed{/lang}'
			});
			
			var $updateHandler = new WBB.Thread.UpdateHandler.Board();
			var $inlineEditor = new WBB.Thread.InlineEditor('.wbbThread');
			$inlineEditor.setUpdateHandler($updateHandler);
			$inlineEditor.setEnvironment('board', {@$board->boardID}, '{link application='wbb' controller='Board' object=$board encode=false}{/link}');
			$inlineEditor.setPermissions({
				canCloseThread: {if $board->getModeratorPermission('canCloseThread')}true{else}false{/if},
				canDeleteThread: {if $board->getModeratorPermission('canDeleteThread')}true{else}false{/if},
				canDeleteThreadCompletely: {if $board->getModeratorPermission('canDeleteThreadCompletely')}true{else}false{/if},
				canEnableThread: {if $board->getModeratorPermission('canEnableThread')}true{else}false{/if},
				canMoveThread: {if $board->getModeratorPermission('canMoveThread')}true{else}false{/if},
				canPinThread: {if $board->getModeratorPermission('canPinThread')}true{else}false{/if},
				canRestoreThread: {if $board->getModeratorPermission('canRestoreThread')}true{else}false{/if}
			});
			
			var $threadClipboard = new WBB.Thread.Clipboard($updateHandler, 'board', {@$board->boardID});
			var $postClipboard = new WBB.Post.Clipboard(null);
			WCF.Clipboard.init('wbb\\page\\BoardPage', {@$hasMarkedItems}, { }, {@$board->boardID});
			
			{if WBB_MODULE_THREAD_MARKING_AS_DONE && $board->enableMarkingAsDone}
				new WBB.Thread.MarkAsDone($updateHandler);
			{/if}
			
			
			
			new WBB.Thread.MarkAsRead();
			new WBB.Board.MarkAllThreadsAsRead({@$board->boardID});
			
			var $options = { };
			{if $pages > 1}
				$options.refreshPage = true;
				{if $pages == $pageNo}
					$options.updatePageNumber = -1;
				{/if}
			{else}
				$options.emptyMessage = '{lang}wbb.board.noThreads{/lang}';
			{/if}
			
			// new WCF.Table.EmptyTableHandler($('.wbbThreadList'), 'wbbThread', $options);
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{if $board->isBoard()}
	{capture assign='sidebar'}
		{include file='boardSidebar' application='wbb'}
	{/capture}
{/if}

{if $board->isBoard()}
	{capture assign='headerNavigation'}
		{if $board->isBoard()}<li><a rel="alternate" href="{if $__wcf->getUser()->userID}{link application='wbb' controller='BoardFeed' id=$board->boardID appendSession=false}at={@$__wcf->getUser()->userID}-{@$__wcf->getUser()->accessToken}{/link}{else}{link application='wbb' controller='BoardFeed' id=$board->boardID appendSession=false}{/link}{/if}" title="{lang}wcf.global.button.rss{/lang}" class="jsTooltip"><span class="icon icon16 icon-rss"></span> <span class="invisible">{lang}wcf.global.button.rss{/lang}</span></a></li>{/if}
		<li class="jsOnly"><a href="#" title="{lang}wbb.board.markAsRead{/lang}" class="markAsReadButton jsTooltip"><span class="icon icon16 icon-ok"></span> <span class="invisible">{lang}wbb.board.markAsRead{/lang}</span></a></li>
	{/capture}
{/if}

{include file='header' sidebarOrientation='right' title=$board->title|language light=true}

<div class="container">
	{include file='userNotice'}

	{if $boardNodeList->valid()}
		{include file='boardNodeListContainer' application='wbb' sandbox=true}
	{/if}
	
	{if $board->isBoard()}
		<div class="action-bar top clearfix">
			<div class="buttons">
				{if $board->canStartThread()}
					<a href="{link application='wbb' controller='ThreadAdd' id=$boardID}{/link}" title="{lang}wbb.thread.add{/lang}" class="btn btn-quaternary"><i class="fa fa-pencil"></i> {lang}wbb.thread.button.add{/lang}</a>
				{elseif $board->isLocked}
				
				{/if}
				{event name='contentNavigationButtonsTop'}
			</div>
			<div class="pagination">
				{anamiPages print=true assign=pagesLinks application='wbb' controller='Board' object=$board link="pageNo=%d$canonicalURLParameters"}
			</div>
		</div>

		{if $objects|count}
			{include file='boardThreadList' application='wbb'}
		{else}
			<p class="alert alert-info">{lang}wbb.board.noThreads{/lang}</p>

			<div class="jsClipboardContainer" data-type="com.woltlab.wbb.thread"></div>
		{/if}
		
		<div class="action-bar bottom clearfix">
			<div class="buttons">
				{if $board->canStartThread()}
					<a href="{link application='wbb' controller='ThreadAdd' id=$boardID}{/link}" title="{lang}wbb.thread.add{/lang}" class="btn btn-quaternary"><i class="fa fa-pencil"></i> {lang}wbb.thread.button.add{/lang}</a>
				{elseif $board->isLocked}
				
				{/if}
			</div>
			<div class="pagination">
				{anamiPages print=true assign=pagesLinks application='wbb' controller='Board' object=$board link="pageNo=%d$canonicalURLParameters"}
			</div>
		</div>
	{/if}
	

</div>

{include file='footer'}

</body>
</html>
