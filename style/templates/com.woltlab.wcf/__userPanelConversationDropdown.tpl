{if MODULE_CONVERSATION && $__wcf->user->userID && $__wcf->session->getPermission('user.conversation.canUseConversation')}
	<li id="unreadConversations" class="hidden-xs" data-count="{#$__wcf->getConversationHandler()->getUnreadConversationCount()}">
		<a href="{link controller='ConversationList'}{/link}"><span class="icon icon16 icon-comments {if $__wcf->getConversationHandler()->getUnreadConversationCount()}active{/if}"></span> {if $__wcf->getConversationHandler()->getUnreadConversationCount()}<span class="badge circular">{#$__wcf->getConversationHandler()->getUnreadConversationCount()}</span>{/if}</a>
		{if !OFFLINE || $__wcf->session->getPermission('admin.general.canViewPageDuringOfflineMode')}
			<script data-relocate="true" src="{@$__wcf->getPath()}js/WCF.Conversation{if !ENABLE_DEBUG_MODE}.min{/if}.js?v={@LAST_UPDATE_TIME}"></script>
			<script data-relocate="true">
				//<![CDATA[
				$(function() {
					new WCF.User.Panel.Conversation({
						markAllAsReadConfirmMessage: '{lang}wcf.conversation.markAllAsRead.confirmMessage{/lang}',
						newConversation: '{lang}wcf.conversation.add{/lang}',
						newConversationLink: '{link controller='ConversationAdd' encode=false}{/link}',
						noItems: '{lang}wcf.conversation.noMoreItems{/lang}',
						showAllLink: '{link controller='ConversationList' encode=false}{/link}',
						title: '{lang}wcf.conversation.conversations{/lang}'
					});
				});
				//]]>
			</script>
		{/if}
	</li>
{/if}