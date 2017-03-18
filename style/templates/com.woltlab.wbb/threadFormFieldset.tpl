{if $threadForm|isset}
	{hascontent}
		<fieldset>
			<legend>{$threadForm->title}</legend>

			{content}
				{foreach from=$threadForm->getElements() item="element"}
					{include application="wbb" file="threadFormElementContainer" formElement=$element}
				{/foreach}

				{event name='threadFormElements'}
			{/content}
		</fieldset>
	{/hascontent}
	
	{* JS used in __threadAddPreviewJS.tpl *}
	<script data-relocate="true" src="{@$__wcf->getPath('wbb')}js/de.wcflabs.wbb.threadForm{if !ENABLE_DEBUG_MODE}.min{/if}.js?v={@LAST_UPDATE_TIME}"></script>
	<script data-relocate="true">
		{*
		{if $threadForm->disableMessage}
			// remove wysiwyg editor and menu (smileys, settings, etc.)
			$("#messageContainer > div > .messageTabMenu").hide(); 
			$("#messageContainer > div > fieldset:last").hide(); 
		{/if}
		*}
		
		{if !$threadForm->customTopic|empty}
			$("#subject").val("Not empty!");
			
			var $disableInformationFieldset = true;
			
			{if (MODULE_TAGGING && WBB_THREAD_ENABLE_TAGS && $board->getPermission('canSetTags')) || $board->getModeratorPermission('canEnableThread') || $labelGroups|count || !$__wcf->user->userID || $availableContentLanguages|count}
				$disableInformationFieldset = false; 
			{else}
				{* for 3rd party plugins which use the informationFields event *}
				{event name='threadFormShowInformationFieldset'}
			{/if}
			
			if ($disableInformationFieldset) {
				// hide information fieldset
				$("#subject").parent().parent().parent().hide();
			} else {
				// hide field
				$("#subject").parent().parent().hide();
			}
		{/if}
		
		WCF.Language.addObject({
			'wbb.thread.form.error.invalid': '{lang}wbb.thread.form.error.invalid{/lang}'
		});
	</script>
{/if} 
