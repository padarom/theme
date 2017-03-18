<div id="cChatMenuContentContainer">
	<div id="cChatDefaultSearchResult">
	{if $cChatMembersOffline|count || $cChatMembers|count || !$cChatFavorites|empty}
		<ul>
			{if !$cChatFavorites|empty}
				{foreach from=$cChatFavorites item=user}
					{if $user->isCChatOnline()}
						<li class="cChatUserSuggest cChatFavoriteUser" data-user-id="{$user->userID}">{@$user->getAvatar()->getImageTag(24)} <div class="cChatUserSuggestIcons"><span class="icon icon-circle icon16 pointer cChatOnline jsTooltip" title="{lang}wcf.cChat.online{/lang}"></span></div><div class="cChatUserSuggestName"><span class="icon icon-star pointer icon16"></span>
						{if $user->cChatUserIsMobile($user) == 1}
						  <span class="jsTooltip icon icon-mobile-phone icon16" title="Mobile browser, chat may not be available"></span>
						{/if}
						{if $user->cChatUserIsTapatalk($user) == 1}
						  <span class="jsTooltip icon icon-tapatalk icon16" title="Tapatalk, chat unavailable"><img src="/images/tapatalk_logo.png" /></span>
						{/if}
						{if $user->cChatGetUserType(56,$user) > 0}
						  <span class="isRecruiter jsTooltip" title="Recruiter">r</span>
						{/if}<span>{@$user->getFormattedUsername()}</span>
						</div></li>
					{else}
						<li class="cChatUserSuggest cChatOfflineUser" data-user-id="{$user->userID}">{@$user->getAvatar()->getImageTag(24)} <div class="cChatUserSuggestIcons"><span>({@$user->lastActivityTime|time})</span></div><div class="cChatUserSuggestName"><span class="icon icon-star pointer icon16"></span>{if $user->cChatGetUserType(56,$user) > 0}
						  <span class="isRecruiterOffline jsTooltip" title="Recruiter">r</span>
						{/if}<span class="isRecruiterSpan">{@$user->getFormattedUsername()}</span>
						</div></li>
					{/if}
				{/foreach}
			{/if}

			{if $cChatMembers|count}
				{assign var=cChatOnline value=$cChatMembers->getObjects()}
				{foreach from=$cChatMembers item=user}
					<li class="cChatUserSuggest cChatOnlineUser" data-user-id="{$user->userID}">{@$user->getAvatar()->getImageTag(24)} <div class="cChatUserSuggestIcons"><span class="icon icon-circle icon16 pointer cChatOnline jsTooltip" title="{lang}wcf.cChat.online{/lang}"></span></div><div class="cChatUserSuggestName">
					{if $user->cChatUserIsMobile($user) == 1}
						  <span class="jsTooltip icon icon-mobile-phone icon16" title="Mobile browser, chat may not be available"></span>
						{/if}
						{if $user->cChatUserIsTapatalk($user) == 1}
						  <span class="jsTooltip icon icon-tapatalk icon16" title="Tapatalk, chat unavailable"><img src="/images/tapatalk_logo.png" /></span>
						{/if}
						{if $user->cChatGetUserType(56,$user) > 0}
						  <span class="isRecruiter jsTooltip" title="Recruiter">r</span>
						{/if}<span>{@$user->getFormattedUsername()}</span>
						</div></li>
				{/foreach}
			{/if}

			{if $cChatMembersOffline|count}
				{foreach from=$cChatMembersOffline item=user}
					{if !$cChatOnline[$user->userID]|isset}
						<li class="cChatUserSuggest cChatOfflineUser" data-user-id="{$user->userID}">{@$user->getAvatar()->getImageTag(24)} <div class="cChatUserSuggestIcons"><span>({@$user->lastActivityTime|time})</span></div><div class="cChatUserSuggestName">{if $user->cChatGetUserType(56,$user) > 0}
						  <span class="isRecruiterOffline jsTooltip" title="Recruiter">r</span>
						{/if}<span class="isRecruiterSpan">{@$user->getFormattedUsername()}</span>
						</div></li>
					{/if}
				{/foreach}
			{/if}
		</ul>
	{else}
		<div class="cChatNoUsers">{lang}wcf.cChat.noUsersFound{/lang}</div>
	{/if}
	</div>
	<div id="cChatSearchResult"></div>
</div>