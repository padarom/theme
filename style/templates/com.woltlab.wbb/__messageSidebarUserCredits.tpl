{if WBB_MESSAGE_SIDEBAR_ENABLE_USER_POSTS}
	<dt><a href="{link controller='Search'}types[]=com.woltlab.wbb.post&userID={@$userProfile->userID}{/link}" title="{lang user=$userProfile}wbb.post.showUserPosts{/lang}" class="jsTooltip">{lang}wbb.post.posts{/lang}</a></dt>
	<dd>{#$userProfile->wbbPosts}</dd>
{/if}