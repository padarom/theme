<a id="top"></a>

{event name='beforePageHeader'}
<header id="header" data-plugin-options='{ "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true }'>
	<div class="header-body">
		<div class="header-container container">
			<div class="header-row" data-sticky-height="40">
				<div class="header-column">
					{if $__wcf->getStyleHandler()->getStyle()->getPageLogo()}
						<div class="header-logo">

							<a href="/">
								<img alt="UnkSo" width="130" height="65" data-sticky-width="100" data-sticky-height="50" data-sticky-top="34" src="{$__wcf->getStyleHandler()->getStyle()->getPageLogo()}">
							</a>

						</div>
					{/if}
				</div>
				<div class="header-column">
					<div class="header-row">
						<div class="header-search hidden-xs">
							{include file='searchArea'}
						</div>
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
					<div class="header-row">
						<div class="header-nav">
							<button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
								<i class="fa fa-bars"></i>
							</button>
							<div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1 collapse">
								
								{include file='mainMenu'}
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

{event name='afterPageHeader'}

<div id="main" class="{if $__wcf->getStyleHandler()->getStyle()->getVariable('useFluidLayout')}layoutFluid{else}layoutFixed{/if}{if $sidebarOrientation|isset && $sidebar|isset} sidebarOrientation{@$sidebarOrientation|ucfirst}{if $sidebarOrientation == 'right' && $sidebarCollapsed} sidebarCollapsed{/if}{/if}{if $light|isset} light{/if}">
	<div>
		<div>			
			<section id="content" class="main" role="main" {if $paddingBottom|isset}style="padding-bottom: {$paddingBottom}px;"{/if}>
				{if MODULE_WCF_AD && $__disableAds|empty}{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.header.content')}{/if}
				
				{event name='contents'}
				
				{if $hideHeader|empty}
					<section class="page-header">
						<div class="container">
							{if $skipBreadcrumbs|empty}
								{include file='breadcrumbs'}
							{/if}
							
							{if $title|isset}
							<div class="row">
								<div class="col-md-12">
									<h1>
										{@$title}
										{if $subtitle|isset}<span>{@$subtitle}</span>{/if}
									</h1>
								</div>
							</div>
							{/if}
							
						</div>
					</section>
				{/if}			
