{if !$startDepth|isset}{assign var='startDepth' value=0}{/if}
{if !$disableAds|isset}{assign var='disableAds' value=false}{/if}
{if MODULE_WCF_AD && !$disableAds}
    {assign var='adIndex' value=1}
{/if}

{foreach from=$boardNodeList item=boardNode key=index}
	{assign var=boardID value=$boardNode->getBoard()->boardID}
	{counter assign=boardNo print=false name='firstboard'}
	
	{if $boardNode->getDepth() == 1}
		{if $boardNode->getBoard()->isCategory() && !$boardNode->getBoard()->getParentBoards()}
			
			<li data-board-id="{@$boardNode->getBoard()->boardID}" {if $boardNode->isCollapsible()}data-is-open="{if $boardNode->isOpen()}true{else}false{/if}" data-depth="{@$boardNode->getDepth()}" {/if}class="{if $boardNode->isCollapsible()} wbbCollapsibleCategory{/if}">
			<div class="forabg">
				<div class="inner">
					<ul class="topiclist">
						<li class="header">
							<dl>
								<dt class="plain"><div class="list-inner" style="position:relative;"><a href="{link application='wbb' controller='Board' object=$boardNode->getBoard()}{/link}" style="margin-left:10px;">{$boardNode->getBoard()->title|language}</a>{if $boardNode->getUnreadThreads()} <span class="badge" style="margin-left:5px;">{#$boardNode->getUnreadThreads()}</span>{/if}</div></dt>
							</dl>
						</li>
					</ul>
				</div>
				
			{if $index >= $boardNodeList->count()}
				</div>
				</li>
			{/if}
		{else}
			{if $boardNo == 1}
				<div class="forabg">
				<ul class="topiclist forums">
				{assign var='forabgOpen' value=true}
			{/if}
			
			{include file='boardNode'}

			{if $boardNode->isLastSibling()}
				</ul>
				</div>
				{assign var='forabgOpen' value=false}
			{/if}
		{/if}
	{elseif $boardNode->getDepth() == 2}
		{counter assign=boardNo print=false name='board_'|concat:$boardID}
		
		{if $boardNo == 1}
			<ul class="topiclist forums">
			{assign var='forabgOpen' value=true}
		{/if}
				
		{include file='boardNode'}

		{if $boardNode->isLastSibling()}
			</ul>
			</div>
			{assign var='forabgOpen' value=false}
		{/if}
	{/if}
{/foreach}

{if $forabgOpen|isset && $forabgOpen}
	</ul>
	</div>
{/if}