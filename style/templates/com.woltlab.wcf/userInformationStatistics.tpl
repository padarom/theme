<dl class="plain {if !$__userStatsClassname|empty}{@$__userStatsClassname}{else}inlineDataList{/if} userStats">
	{event name='statistics'}
	
	{if MODULE_LIKE && $user->likesReceived}
		<dt><a href="{link controller='User' object=$user}{/link}#likes" class="jsTooltip" title="{lang}wcf.like.showLikesReceived{/lang}">{lang}wcf.like.likesReceived{/lang}</a></dt>
		<dd>{#$user->likesReceived}</dd>
	{/if}
	
	{if $user->activityPoints}
		<dt><a href="#" class="activityPointsDisplay jsTooltip" title="{lang}wcf.user.activityPoint.showActivityPoints{/lang}" data-user-id="{@$user->userID}">{lang}wcf.user.activityPoint{/lang}</a></dt>
		<dd>{#$user->activityPoints}</dd>
	{/if}
	
	{capture assign='userActivityBlob'}
		{if $user->lastActivityTime > TIME_NOW - 60*60*24*2}
			<i class="fa fa-circle" title="Active within last 2 days" style="color:#2ab32a;"></i>
		{elseif $user->lastActivityTime > TIME_NOW - 60*60*24*5}
			<i class="fa fa-circle" title="Active within last 5 days" style="color:#fbde00;"></i>
		{elseif $user->lastActivityTime > TIME_NOW - 60*60*24*10}
			<i class="fa fa-circle" title="Active within last 10 days" style="color:#fdb229;"></i>
		{else}
			<i class="fa fa-circle" title="Inactive for more than 10 days" style="color:#e02c2c;"></i>
		{/if}
	{/capture}
	<dt>Last Activity</dt>
	<dd>{@$userActivityBlob} {@$user->lastActivityTime|time}</dd>
</dl>