{if $sidebar|isset}
    <aside class="menuSidebar">
        <div>
            {if MODULE_WCF_AD && $__disableAds|empty}{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.sidebar.top')}{/if}
            
            {event name='sidebarBoxesTop'}
			
            {@$sidebar}
            
            {event name='sidebarBoxesBottom'}
            
            {if MODULE_WCF_AD && $__disableAds|empty}{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.sidebar.bottom')}{/if}
        </div>
    </aside>
{/if}