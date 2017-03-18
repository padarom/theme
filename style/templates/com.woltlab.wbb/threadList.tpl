{* default values *}
{if !$enableEditMode|isset}{assign var='enableEditMode' value=true}{/if}
{if !$enableWatchMode|isset}{assign var='enableWatchMode' value=false}{/if}
{if !$showLikeColumn|isset}{assign var='showLikeColumn' value=true}{/if}
{if !$showViewColumn|isset}{assign var='showViewColumn' value=true}{/if}
{if !$showBoardLink|isset}{assign var='showBoardLink' value=false}{/if}
{if !$showLabels|isset}{assign var='showLabels' value=true}{/if}
{if !$showAnnouncementsSeparately|isset}{assign var='showAnnouncementsSeparately' value=true}{/if}
{assign var='showLanguageFlag' value=false}
{if $__wcf->user->getLanguageIDs()|count > 1}{assign var='showLanguageFlag' value=true}{/if}

{if $showAnnouncementsSeparately}
	{* Find announcements and show first *}
	{hascontent}
		<div class="forumbg announcement">
			<div class="inner">
				<ul class="topiclist">
					<li class="header">
						<dl>
							<dt class="plain"><div class="list-inner">Announcements</div></dt>
						</dl>
					</li>
				</ul>
				<ul class="topiclist topics">
					{content}
						{foreach from=$objects item=thread}
							{if $thread->isAnnouncement}
								{assign var='announcementsAvailable' value=true}
								{include file='threadNode'}
							{/if}
						{/foreach}
					{/content}
				</ul>
			</div>
		</div>
	{/hascontent}

	{if $announcementsAvailable|isset}
		{* Rewind object list *}
		{$objects->rewind()}
	{/if}
{/if}

<div class="forumbg">
	<div class="inner">
		<ul class="topiclist">
			<li class="header">
				<dl>
					<dt class="plain"><div class="list-inner">Topics</div>
						{if $templateName == 'searchResult'}<div style="position:absolute; right:5px; top:0;">
							<span class="jsOnly"><a title="{lang}wbb.index.markAsRead{/lang}" class="markAllAsReadButton jsTooltip"><span class="icon icon16 icon-ok"></span> <span class="invisible">{lang}wbb.index.markAsRead{/lang}</span></a></span>
						</div>{/if}
					</dt>
				</dl>
			</li>
		</ul>
		<ul class="topiclist topics">
			{foreach from=$objects item=thread}
				{if !$thread->isAnnouncement || !$showAnnouncementsSeparately}
					{include file='threadNode'}
				{/if}
			{/foreach}
		</ul>
	</div>
</div>