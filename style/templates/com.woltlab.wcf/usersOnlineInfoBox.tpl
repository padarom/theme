{if !$usersOnlineShowRecord|isset}{assign var='usersOnlineShowRecord' value=true}{/if}
{if MODULE_USERS_ONLINE && $__wcf->session->getPermission('user.profile.canViewUsersOnlineList') && $usersOnlineList->stats[total]}		
    <div>
        <div class="containerHeadline">
            <h3><a href="{link controller='UsersOnlineList'}{/link}">Who is online</a></h3>
            <p>
                In total there {if $usersOnlineList->stats[members] == 1}is{else}are{/if} <strong>{#$usersOnlineList->stats[members]+$usersOnlineList->stats[guests]}</strong> user{if $usersOnlineList->stats[members] != 1}s{/if} online 
                ::
                {#$usersOnlineList->stats[members]} registered, {#$usersOnlineList->stats[invisible]} invisible and {#$usersOnlineList->stats[guests]} guest{if $usersOnlineList->stats[guests] != 1}s{/if}
                <br>
                <br>
                Most users ever online was <strong>{#USERS_ONLINE_RECORD}</strong> - {@USERS_ONLINE_RECORD_TIME|time}
                <br>
                <br>
                <span style="margin-right:5px;">Registered users:</span>
                {if $usersOnlineList|count}
                    {foreach from=$usersOnlineList->getObjects() item=userOnline}{counter assign=currentIndex print=false name='users'}{if $currentIndex > 1},{/if} <a href="{link controller='User' object=$userOnline->getDecoratedObject()}{/link}" {*class="userLink" data-user-id="{@$userOnline->userID}"*}>{@$userOnline->getFormattedUsername()}</a>{/foreach}
                {else}
                    No registered users
                {/if}
                
                {if USERS_ONLINE_ENABLE_LEGEND && $usersOnlineList->getUsersOnlineMarkings()|count}
                    <div class="usersOnlineLegend">
                        <p>
							<span style="margin-right:5px;">{lang}wcf.user.usersOnline.marking.legend{/lang}:</span>
							
							{assign var='onlineMarkings' value=$usersOnlineList->getUsersOnlineMarkings()}
							{foreach from=$onlineMarkings item=usersOnlineMarking}
								{counter assign=currentIndex print=false name='legend'}
								{if $currentIndex > 1},{/if} {@$usersOnlineMarking}
							{/foreach}
						</p>
                    </div>
                {/if}
            </p>
        </div>
    </div>
{/if}
