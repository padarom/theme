{capture assign='sidebar'}
    {assign var=__userMenuActiveItems value=$__wcf->getUserMenu()->getActiveMenuItems()}
	
	{foreach from=$__wcf->getUserMenu()->getMenuItems('') item=menuCategory}
		<fieldset>
			<legend>{lang}{$menuCategory->menuItem}{/lang}</legend>
			
			<nav>
				<ul>
					{foreach from=$__wcf->getUserMenu()->getMenuItems($menuCategory->menuItem) item=menuItem}
						{if $menuItem->menuItem|in_array:$__userMenuActiveItems}
							<li class="active"><strong><a href="{$menuItem->getProcessor()->getLink()}">{@$menuItem}</a></strong></li>
						{else}
							<li><a href="{$menuItem->getProcessor()->getLink()}">{@$menuItem}</a></li>
						{/if}
					{/foreach}
				</ul>
			</nav>
		</fieldset>
	{/foreach}
{/capture}