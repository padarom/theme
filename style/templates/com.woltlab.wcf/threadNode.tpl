<li class="wbbThread row" data-thread-id="{@$thread->threadID}" data-element-id="{@$thread->threadID}"{if $thread->getBoard()->canEditThreads()} data-is-closed="{@$thread->isClosed}" data-is-deleted="{@$thread->isDeleted}" data-is-sticky="{@$thread->isSticky}" data-is-disabled="{@$thread->isDisabled}" data-is-announcement="{@$thread->isAnnouncement}"{/if}{if WBB_MODULE_THREAD_MARKING_AS_DONE && $thread->getBoard()->enableMarkingAsDone} data-is-done="{@$thread->isDone}" data-can-mark-as-done="{if $thread->canMarkAsDone()}1{else}0{/if}"{/if} data-is-link="{if $thread->movedThreadID}1{else}0{/if}">
	<dl class="form_read plain" style="overflow:auto;">
		<dt title="No unread posts">
			<span class="ico_{if $thread->isSticky}sticky{elseif $thread->isAnnouncement}announce{else}topic{/if}_{if $thread->isDeleted}deleted{else}{if $thread->isNew()}unread{else}read{/if}{if $thread->isClosed}_locked{/if}{/if}">
			</span>
			<div class="list-inner">
				<a href="{link application='wbb' controller='Thread' object=$thread}{/link}" class="topictitle" {if $thread->isDeleted}style="text-decoration:line-through;"{/if}>{$thread->topic}</a>
				{if $thread->isDeleted}
					<br>
					{@$thread->getDeleteNote()}
				{/if}
				<br>
				{if $thread->polls}<span class="topic-ap"><i class="fa fa-tasks"></i></span>{/if}
				by {if $thread->userID}<a href="{link controller='User' object=$thread->getUserProfile()->getDecoratedObject()}{/link}" class="userLink" data-user-id="{@$thread->userID}">{$thread->username}</a>{else}{$thread->username}{/if} 
				&raquo;&nbsp;{@$thread->time|time} {if $enableEditMode && $thread->getBoard()->canEditThreads()}- <a class="jsThreadInlineEditor">{lang}wcf.global.button.edit{/lang}</a>{/if}
				{if $showBoardLink}<br>(In <a href="{link application='wbb' controller='Board' object=$thread->getBoard()}{/link}">{$thread->getBoard()->title|language}</a>){/if}
				
				{if $thread->hasLabels() && $showLabels}
					<br>
					<span class="labels">
						{foreach from=$thread->getLabels() item=label}
							<a href="{link application='wbb' controller='Board' object=$thread->getBoard()}labelIDs[{@$label->groupID}]={@$label->labelID}{/link}" class="badge{if $label->getClassNames()} {$label->getClassNames()}{/if} jsTooltip" title="{lang}wbb.thread.labeledThreads{/lang}">{lang}{$label->label}{/lang}</a>
						{/foreach}
					</span>
				{/if}
				<div class="pagination">
					{smallpages pages=$thread->getPages() application='wbb' controller='Thread' object=$thread link='pageNo=%d'}
				</div>
			</div>
		</dt>
		<dd class="posts hidden-sm hidden-xs">
			{#$thread->replies}
			<dfn>Replies</dfn>
		</dd>
		<dd class="views hidden-sm hidden-xs">
			{#$thread->views}
			<dfn>Views</dfn>
		</dd>
		<dd class="lastpost hidden-xs">
			{if $thread->replies}									
				by {if $thread->lastPosterID}<a href="{link controller='User' object=$thread->getLastPosterProfile()->getDecoratedObject()}{/link}" class="userLink" data-user-id="{@$thread->getLastPosterProfile()->userID}">{$thread->lastPoster}</a>{else}{$thread->lastPoster}{/if} <a href="{if $thread->movedThreadID}{link application='wbb' controller='Thread' object=$thread->getMovedThread()}action=lastPost{/link}{else}{link application='wbb' controller='Thread' object=$thread}action=lastPost{/link}{/if}"><i class="fa fa-arrow-right"></i></a>
				<br>
				{@$thread->lastPostTime|time}
			{/if}
		</dd>
	</dl>
</li>