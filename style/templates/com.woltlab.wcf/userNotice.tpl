<div class="userNotice">
	{if OFFLINE && $__wcf->session->getPermission('admin.general.canViewPageDuringOfflineMode')}
		<div class="alert alert-warning">
			<p><strong>{lang}wcf.page.offline{/lang}</strong></p>
			<p>{if OFFLINE_MESSAGE_ALLOW_HTML}{@OFFLINE_MESSAGE|language}{else}{@OFFLINE_MESSAGE|language|newlineToBreak}{/if}</p>
		</div>
	{/if}
	
	{if MODULE_COOKIE_POLICY_PAGE && $__wcf->session->isFirstVisit() && !$__wcf->user->userID}
		<p class="alert alert-info">{lang}wcf.page.cookiePolicy.info{/lang}</p>
	{/if}
	
	{if $__wcf->session->getPermission('admin.system.package.canUpdatePackage') && $__wcf->getAvailableUpdates()}
		<p class="alert alert-info">{lang}wcf.global.availableUpdates{/lang}</p>
	{/if}
	
	<noscript>
		<p class="alert alert-warning">{lang}wcf.page.javascriptDisabled{/lang}</p>
	</noscript>
	
	{if $__wcf->user->activationCode && REGISTER_ACTIVATION_METHOD == 1 && $templateName != 'registerActivation'}
		<p class="alert alert-warning">{lang}wcf.user.register.needActivation{/lang}</p>
	{/if}
	
	{foreach from=$__wcf->getNoticeHandler()->getVisibleNotices() item='notice'}
		<p class="alert alert-{$notice->cssClassName} {if $notice->isDismissible} alert-dismissible{/if}">			
			{if $notice->noticeUseHtml}{@$notice->notice|language}{else}{@$notice->notice|language|htmlspecialchars|nl2br}{/if}
			
			{if $notice->isDismissible}
				<button type="button" class="close pointer jsDismissNoticeButton jsTooltip" data-object-id="{$notice->noticeID} title="{lang}wcf.notice.button.dismiss{/lang}">&times;</button>
			{/if}
		</p>
	{/foreach}
	
	{event name='userNotice'}
</div>
