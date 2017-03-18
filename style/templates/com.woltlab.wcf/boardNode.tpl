<li class="row">
	<dl class="form_read plain" style="overflow:auto;">
		<dt title="{if $boardNode->getUnreadThreads()} unread posts{else}No unread posts{/if}" data-board-id="{@$boardNode->getBoard()->boardID}">
			<span class="ico_forum_{if $boardNode->getBoard()->isExternalLink()}link{else}{if $boardNode->getUnreadThreads()}un{/if}read{if $boardNode->getBoard()->isClosed}_locked{/if}{/if} {if $boardNode->getUnreadThreads()} markAsRead{/if}" {if $boardNode->getUnreadThreads()} title="{lang}wbb.board.markAsRead.doubleClick{/lang}"{/if}>
			</span>
			<div class="list-inner">
			<a href="{link application='wbb' controller='Board' object=$boardNode->getBoard()}{/link}" class="forumtitle">{$boardNode->getBoard()->title|language}</a> {if $boardNode->getUnreadThreads()}<div class="badge badge-inverse">{#$boardNode->getUnreadThreads()}</div>{/if}
				{if $boardNode->getBoard()->description|language}
					<br>
					{if $boardNode->getBoard()->descriptionUseHtml}{@$boardNode->getBoard()->description|language}{else}{$boardNode->getBoard()->description|language}{/if}
					{/if}
				{if $boardNode->hasChildren()}
					<br>
					<b>Sub-Forums:</b> {include file='boardNodeListSubForums' parent=$boardNode->getBoard()->boardID children=$boardNode->count()}
				{/if}
			</div>
		</dt>
		{if !$boardNode->getBoard()->isCategory()}
			<dd class="topics hidden-sm hidden-xs">
				{#$boardNode->getThreads()}
				<dfn>Topics</dfn>
			</dd>
			<dd class="posts hidden-sm hidden-xs">
				{#$boardNode->getPosts()}
				<dfn>Posts</dfn>
			</dd>
			<dd class="lastpost hidden-xs">
				{if $boardNode->getLastPost()}
					<a href="{link application='wbb' controller='Thread' id=$boardNode->getLastPost()->threadID title=$boardNode->getLastPost()->topic}action=firstNew{/link}" {if $boardNode->getLastPost()->getBoard()->getPermission('canReadThread')} class="wbbTopicLink"{/if} data-thread-id="{@$boardNode->getLastPost()->threadID}" data-sort-order="DESC">{$boardNode->getLastPost()->topic|truncate:45:'...'}</a>
					<br>
					{if $boardNode->getLastPost()->lastPosterID}
						<a href="{link controller='User' id=$boardNode->getLastPost()->lastPosterID title=$boardNode->getLastPost()->lastPoster}{/link}" class="userLink" data-user-id="{@$boardNode->getLastPost()->lastPosterID}">{$boardNode->getLastPost()->lastPoster}</a>
					{else}
						{$boardNode->getLastPost()->lastPoster}
					{/if}
					- {@$boardNode->getLastPost()->lastPostTime|time}
				{/if}
			</dd>
		{/if}
	</dl>
</li>