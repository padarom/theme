<a id="top"></a>

{event name='beforePageHeader'}
<header id="header" data-plugin-options='{ "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true }'>
	<div class="header-body">
		<div class="header-container container">
			<div class="header-row" data-sticky-height="40">
				<div class="header-column">
					{if $__wcf->getStyleHandler()->getStyle()->getPageLogo()}
						<div class="header-logo">

							<a href="#">
								<img alt="UnkSo" width="130" height="65" data-sticky-width="100" data-sticky-height="50" data-sticky-top="30" src="{$__wcf->getStyleHandler()->getStyle()->getPageLogo()}">
							</a>

						</div>
					{/if}
				</div>
				<div class="header-column">
					<div class="header-row">
						<nav class="header-nav-top">
							{hascontent}
								<ul class="nav nav-pills" id="userpanel">
									{content}
										{include file='userPanel'}
										{event name='topMenu'}
									{/content}
								</ul>
							{/hascontent}
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

{event name='afterPageHeader'}

<div id="main">
	<div>			
		<section id="content" class="main" role="main" {if $paddingBottom|isset}style="padding-bottom: {$paddingBottom}px;"{/if}>
			{if MODULE_WCF_AD && $__disableAds|empty}{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.header.content')}{/if}
				
			{event name='contents'}