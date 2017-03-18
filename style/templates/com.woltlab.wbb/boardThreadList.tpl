{include file='threadList' application='wbb'}

{*
<div class="marginTop tabularBox tabularBoxTitle messageGroupList wbbThreadList jsClipboardContainer" data-type="com.woltlab.wbb.thread">
	<header>
		<h2>{lang}wbb.thread.threads{/lang}</h2>
	</header>
	
	<table class="table">
		<thead>
			<tr>
				{if $board->canEditThreads()}<th class="columnMark jsOnly"><label><input type="checkbox" class="jsClipboardMarkAll" /></label></th>{/if}
				<th colspan="2" class="columnTitle columnSubject{if $sortField == 'topic'} active {@$sortOrder}{/if}"><a rel="nofollow" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo}&sortField=topic&sortOrder={if $sortField == 'topic' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@$additionalLinkParameters}{/link}">{lang}wbb.thread.topic{/lang}</a></th>
				<th class="columnDigits columnReplies{if $sortField == 'replies'} active {@$sortOrder}{/if}"><a rel="nofollow" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo}&sortField=replies&sortOrder={if $sortField == 'replies' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@$additionalLinkParameters}{/link}">{lang}wbb.thread.replies{/lang}</a></th>
				{if MODULE_LIKE && $__wcf->getSession()->getPermission('user.like.canViewLike')}<th class="columnDigits columnLikes{if $sortField == 'cumulativeLikes'} active {@$sortOrder}{/if}"><a rel="nofollow" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo}&sortField=cumulativeLikes&sortOrder={if $sortField == 'cumulativeLikes' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@$additionalLinkParameters}{/link}">{lang}wcf.like.cumulativeLikes{/lang}</a></th>{/if}
				<th class="columnDigits columnViews{if $sortField == 'views'} active {@$sortOrder}{/if}"><a rel="nofollow" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo}&sortField=views&sortOrder={if $sortField == 'views' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@$additionalLinkParameters}{/link}">{lang}wbb.thread.views{/lang}</a></th>
				<th class="columnText columnLastPost{if $sortField == 'lastPostTime'} active {@$sortOrder}{/if}"><a rel="nofollow" href="{link application='wbb' controller='Board' object=$board}pageNo={@$pageNo}&sortField=lastPostTime&sortOrder={if $sortField == 'lastPostTime' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@$additionalLinkParameters}{/link}">{lang}wbb.thread.lastPostTime{/lang}</a></th>
				
				{event name='columnHeads'}
			</tr>
		</thead>
		
		<tbody>
			{include file='threadList' application='wbb' new=false}
		</tbody>
	</table>
</div>
*}