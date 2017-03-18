{if $__wcf->getPageMenu()->getMenuItems('header')|count > 0}
	<nav>
		<ul class="nav nav-pills" id="mainNav">
			{foreach from=$__wcf->getPageMenu()->getMenuItems('header') item=menuItem}
				<li class="{if $__wcf->getPageMenu()->getMenuItems($menuItem->menuItem)|count > 0}dropdown{/if} {if $__wcf->getPageMenu()->getActiveMenuItem() == $menuItem->menuItem} active{/if}" data-menu-item="{$menuItem->menuItem}">
					<a href="{$menuItem->getProcessor()->getLink()}" {if $__wcf->getPageMenu()->getMenuItems($menuItem->menuItem)|count > 0}class="dropdown-toggle"{/if}>{lang}{$menuItem->menuItem}{/lang}{if $menuItem->getProcessor()->getNotifications()} <span class="badge badgeUpdate">{#$menuItem->getProcessor()->getNotifications()}</span>{/if}</a>
					{if $__wcf->getPageMenu()->getMenuItems($menuItem->menuItem)|count > 0}
						<ul class="dropdown-menu">
							{foreach from=$__wcf->getPageMenu()->getMenuItems($menuItem->menuItem) item=subMenuItem}
								<li{if $__wcf->getPageMenu()->getActiveMenuItem(1) == $subMenuItem->menuItem} class="active"{/if}><a {if !$subMenuItem->originIsSystem}target="_blank"{/if} href="{$subMenuItem->getProcessor()->getLink()}"><span>{lang}{$subMenuItem->menuItem}{/lang}</span></a>{if $subMenuItem->getProcessor()->getNotifications()} <span class="badge badgeUpdate">{#$subMenuItem->getProcessor()->getNotifications()}</span>{/if}</li>
							{/foreach}
							{event name='items'}
						</ul>
					{/if}
				</li>
			{/foreach}
		</ul>
	</nav>
{/if}
