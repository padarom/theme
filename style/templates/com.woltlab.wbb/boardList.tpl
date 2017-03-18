{include file='documentHeader'}

<head>
	<title>{if $__wcf->getPageMenu()->getLandingPage()->menuItem != 'wbb.header.menu.board'}{lang}wbb.header.menu.board{/lang} - {/if}{PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
	{if $__wcf->getUser()->userID}
		<link rel="alternate" type="application/rss+xml" title="{lang}wcf.global.button.rss{/lang}" href="{link application='wbb' controller='BoardFeed' appendSession=false}at={@$__wcf->getUser()->userID}-{@$__wcf->getUser()->accessToken}{/link}" />
	{else}
		<link rel="alternate" type="application/rss+xml" title="{lang}wcf.global.button.rss{/lang}" href="{link application='wbb' controller='BoardFeed' appendSession=false}{/link}" />
	{/if}
	<link rel="canonical" href="{link application='wbb' controller='BoardList'}{/link}" />
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			/**
			 * Marks a board as read.
			 */
			WBB.Board.MarkAsRead = Class.extend({
				init: function() {
					console.log("Init");
					this._proxy = new WCF.Action.Proxy({
						success: $.proxy(this._success, this)
					});
					
					$(document).on('dblclick', '.wbbBoardList .markAsRead', $.proxy(this._dblClick, this));
				},
			
				_dblClick: function(event) {
					console.log("Double click");
					this._proxy.setOption('data', {
						actionName: 'markAsRead',
						className: 'wbb\\data\\board\\BoardAction',
						objectIDs: [ $(event.currentTarget).parents('dt:eq(0)').data('boardID') ]
						//objectIDs: [ $(event.currentTarget).parents('li:eq(0)').data('boardID') ]
					});
					this._proxy.sendRequest();
				},
				
				_success: function(data, textStatus, jqXHR) {
					console.log("Success");
					var self = this;
					$('.wbbBoardList .markAsRead').each(function(index, element) {
						var $element = $(element);
						var $boardElement = $element.parents('dt:eq(0)');
						//var $boardElement = $element.parents('li:eq(0)');
						if (WCF.inArray($boardElement.data('boardID'), data.objectIDs)) {
							self._markAsRead($boardElement, $element);
						}
					});
				},
				
				_markAsRead: function(board, icon) {
					// remove new class
					//board.removeClass('new').find('.new:eq(0)').removeClass('new');
					board.removeClass('ico_forum_unread').attr("title", "").find('.ico_forum_unread:eq(0)').removeClass('ico_forum_unread').attr("title", "").addClass('ico_forum_read');
					icon.removeClass('markAsRead');
					
					// remove badges
					board.find('.badge:eq(0)').hide();
					board.find('.badge-inverse:eq(0)').removeClass('.badge-inverse');
					
					// toggle icon
					if (icon.hasClass('icon-folder-close')) {
						icon.removeClass('icon-folder-close').addClass('icon-folder-close-alt');
					}
					
					// remove event
					icon.unbind('dblclick');
					
					// update child boards
					var self = this;
					board.find('ul:eq(0)').children('li').each(function(index, childBoard) {
					//board.find('ul:eq(0)').children('dt').each(function(index, childBoard) {
						var $childBoard = $(childBoard);
						self._markAsRead($childBoard, $childBoard.find('.markAsRead:eq(0)'));
					});
				}
			});
			
		
			WCF.Language.addObject({
				'wbb.index.ignoreBoards': '{lang}wbb.index.ignoreBoards{/lang}'
			});
			new WBB.Board.MarkAllAsRead();
			new WBB.Board.IgnoreBoards();
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

{if $__boxSidebar|isset && $__boxSidebar}
	{capture assign='sidebar'}
		{@$__boxSidebar}
	{/capture}
{/if}

{capture assign='headerNavigation'}
<li><a rel="alternate" href="{if $__wcf->getUser()->userID}{link application='wbb' controller='BoardFeed' appendSession=false}at={@$__wcf->getUser()->userID}-{@$__wcf->getUser()->accessToken}{/link}{else}{link application='wbb' controller='BoardFeed' appendSession=false}{/link}{/if}" title="{lang}wcf.global.button.rss{/lang}" class="jsTooltip"><span class="icon icon16 icon-rss"></span> <span class="invisible">{lang}wcf.global.button.rss{/lang}</span></a></li>
<li class="jsOnly"><a href="#" title="{lang}wbb.index.markAsRead{/lang}" class="markAllAsReadButton jsTooltip"><span class="icon icon16 icon-ok"></span> <span class="invisible">{lang}wbb.index.markAsRead{/lang}</span></a></li>

{if WBB_MODULE_IGNORE_BOARDS && $__wcf->user->userID}
	<li class="jsOnly"><a href="#" title="{lang}wbb.index.ignoreBoards{/lang}" class="ignoreBoardsButton jsTooltip"><span class="icon icon16 icon-eye-close"></span> <span class="invisible">{lang}wbb.index.ignoreBoards{/lang}</span></a></li>
{/if}
{/capture}

{include file='header' sidebarOrientation='right' title='wbb.header.menu.board'|language}

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
	{include file='userNotice'}
	
	{include file='boardNodeListContainer' application='wbb'}
	{*
	<div class="" style="float:right;width:250px;border:1px solid #ddd;border-radius:3px;padding:10px;">
		{@$sidebar}
	</div>
	<div class="centralContent" style="margin-right: 270px">
		{include file='boardNodeListContainer' application='wbb'}
	</div>
	*}
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

{hascontent}
	<div class="background-deep below-forums-list">
		<ul class="marginTop containerList infoBoxList">
			<div class="container">
				{content}
					{if WBB_INDEX_ENABLE_ONLINE_LIST}
						{include file='usersOnlineInfoBox'}
					{/if}

					{if WBB_INDEX_ENABLE_STATS}
						<div class="start-block statistics hidden-xs">
							<div class="row">
								<div class="col-md-3 col-sm-6">
									Total posts
									<strong>{#$stats[posts]}</strong>
								</div>
								<div class="col-md-3 col-sm-6">
									Total topics
									<strong>{#$stats[threads]}</strong>
								</div>
								<div class="col-md-3 col-sm-6">
									Total members
									<strong>{#$stats[members]}</strong>
								</div>
								<div class="col-md-3 col-sm-6">
									Our newest member
									<strong>
										<a href="{link controller='User' object=$stats[newestMember]}{/link}" class="userLink" data-user-id="{@$stats[newestMember]->userID}">{@$stats[newestMember]->username}</a>
									</strong>
								</div>
							</div>
						</div>
					{/if}

					{event name='infoBoxes'}
				{/content}
			</div>
		</ul>
	</div>
{/hascontent}

{include file='footer' skipBreadcrumbs=true}

</body>
</html>
