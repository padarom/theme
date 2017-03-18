{foreach from=$cChat item=cChatWindow}
	{if $cChatWindow[status] != 2}
		{assign var=isIgnored value=false}
		{if !$cChatWindow[room]->isGroupChat}
			{assign var=chatPartner value=$cChatWindow[room]->getChatPartner()}
			{if $chatPartner|isset && $chatPartner->isIgnoredUser($__wcf->getUser()->userID)}
				{assign var=isIgnored value=true}
			{/if}
		{/if}
		<div class="cChatWindow{if $cChatWindow[status] == 1} opened{/if}{if $cChatWindow[room]->isGroupChat} cChatGroupChat{/if}" id="cChatWindow{$cChatWindow[room]->roomID}" data-roomid="{$cChatWindow[room]->roomID}">
			<div class="cChatWindowHeader cChatWindowHeaderDefault{if $cChatWindow[status] == 1} hidden{/if}">
			<div id="cChatUnread{$cChatWindow[room]->roomID}" class="cChatUnread">0</div>
				<div class="cChatWindowHeaderInline">
					{if !$cChatWindow[room]->isGroupChat}
						{if $cChatWindow[users][0][online]}
							<span class="icon icon-circle cChatOnline jsTooltip" title="{lang}wcf.cChat.online{/lang}"></span>
						{/if}
					{/if}
					{if $cChatWindow[room]->isGroupChat}
						<span class="icon icon-group jsTooltip" title="{lang}wcf.cChat.groupChat{/lang}"></span>
						<div title="{$cChatWindow[room]->getName(true)}" class="cChatName jsTooltip">{$cChatWindow[room]->getName()}</div>
					{else}
						<div class="cChatName">{$cChatWindow[room]->getName()}</div>
					{/if}
					<span class="cChatWindowRemove cChatWindowIcon jsTooltip" data-roomid="{$cChatWindow[room]->roomID}" title="{lang}wcf.cChat.window.close{/lang}">
						<span class="icon icon-remove" ></span>
					</span>

				</div>
			</div>

			<div class="cChatWindowContainer{if $cChatWindow[status] == 0} hidden{/if}">
				<div class="cChatWindowHeader cChatColoredHeader">
					<div class="cChatWindowHeaderInline">
						{if !$cChatWindow[room]->isGroupChat}
							{if $cChatWindow[users][0][online]}
								<span class="icon icon-circle cChatOnline jsTooltip" title="{lang}wcf.cChat.online{/lang}"></span>
							{/if}
						{/if}
						{if $cChatWindow[room]->isGroupChat}
							<span class="icon icon-group jsTooltip" title="{lang}wcf.cChat.groupChat{/lang}"></span> <div title="{$cChatWindow[room]->getName(true)}" class="cChatName jsTooltip">{$cChatWindow[room]->getName()}</div>
						{else}
							<div class="cChatName"><a class="cChatUserLink" href="{link controller='User' object=$cChatWindow[room]->getChatPartner()}{/link}">{$cChatWindow[room]->getName()}</a></div>
						{/if}
						<span class="cChatWindowRemove cChatWindowIcon jsTooltip" data-roomid="{$cChatWindow[room]->roomID}" title="{lang}wcf.cChat.window.close{/lang}">
							<span class="icon icon-remove"></span>
						</span>

						<div class="dropdown cChatWindowIcon jsTooltip" title="{lang}wcf.cChat.window.options{/lang}">
							<span class="dropdownToggle">
								<span class="toggleIcon icon icon-cog" data-roomid="{$cChatWindow[room]->roomID}"></span>
							</span>
							<div class="dropdownMenu">
									<ul class="scrollableDropdownMenu">
										<!--<li class="fullConversation" data-roomid="{$cChatWindow[room]->roomID}"><a href="{link controller='CChatList'}roomID={$cChatWindow[room]->roomID}{/link}">{lang}wcf.cChat.window.options.fullConversation{/lang}</a></li>-->
										<!--<li class="markAsFavorite convertChatToConversation"><span><form id="sendConvertedChat" action="{link controller='CChatRoom' object=$cChatWindow[room]->convertToConversation()}{/link}"><input type="submit" value="convert to conversation" name="convertChat" id="convertChat" /></form></span></li>-->
										{if !$cChatWindow[room]->isGroupChat}<li class="markAsFavorite" data-roomid="{$cChatWindow[room]->roomID}"><span><strong>{$cChatWindow[room]->getChatPartner()->username}</strong> <span>{if $cChatWindow[room]->isFavored()}{lang}wcf.cChat.options.unmarkAsFavorite{/lang}{else}{lang}wcf.cChat.options.markAsFavorite{/lang}{/if}</span></span></li>{/if}
										{event name='cChatWindowDropdown'}
									</ul>
							</div>
						</div>
					</div>
				</div>

				{if $isIgnored}
					<div class="cChatWindowRollover cChatWindowIgnored">
						{lang}wcf.cChat.ignored{/lang}
					</div>
				{/if}

				<div class="cChatWindowContent">
					{include file="cChatMessages" messages=$cChatWindow[room]->getLastMessages()}
				</div>
				<div class="cChatWindowInput">
					<textarea class="cChatInput cChatWindowChatInput" id="cChatWindowInput{$cChatWindow[room]->roomID}"{if $isIgnored} disabled="disabled"{/if} style="width:216px;"></textarea>
					<div class="cChatWindowInputContainer" style="width: 24px;">
						<div class="dropdown cChatSmileyDropdown cChatWindowInputIconContainer" data-roomid="{$cChatWindow[room]->roomID}">
							<span class="icon icon-smile icon16 pointer dropdownToggle"></span>
							<div class="dropdownMenu cChatSmileyBox" id="cChatSmileyBox{$cChatWindow[room]->roomID}" data-roomid="{$cChatWindow[room]->roomID}">
								<ul>
									<li class="dropdownText"><span class="icon icon48 icon-spinner cChatCentered"></span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		{/if}
		{$cChatWindow[room]->resetUsers()}
{/foreach}