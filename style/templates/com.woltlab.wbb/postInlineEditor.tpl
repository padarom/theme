{capture assign='wysiwygContainerID'}messageEditor{@$post->postID}{/capture}
<div class="messageInlineEditor">
	<textarea id="messageEditor{@$post->postID}" rows="20" cols="40" data-autosave="com.woltlab.wbb.postEdit-{@$post->postID}" data-autosave-last-edit-time="{@$post->lastEditTime}">{$post->message}</textarea>
	{include file='messageFormTabsInline' inPostInlineEdit=true preselectTabMenu='settings'}
	
	<div class="formSubmit">
		<button class="btn btn-primary" data-type="save">{lang}wcf.global.button.submit{/lang}</button>
		<button class="btn btn-secondary" data-type="extended">{lang}wcf.message.button.extendedEdit{/lang}</button>
		<button class="btn btn-secondary" data-type="cancel">{lang}wcf.global.button.cancel{/lang}</button>
	</div>
	
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			WCF.System.Dependency.Manager.register('Redactor_messageEditor{@$post->postID}', function() { new WCF.Message.UserMention('messageEditor{@$post->postID}'); });
		});
		//]]>
	</script>
	{include file='wysiwyg' wysiwygEnableUpload=true}
</div>