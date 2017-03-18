{if !$__microdata|isset}{assign var=__microdata value=true}{/if}
{hascontent}
	<div class="breadcrumbs">
		<div>
			<ul class="breadcrumb">
					{content}
						{foreach from=$__wcf->getBreadcrumbs() item=$breadcrumb key=$count}
							<li title="{$breadcrumb->getLabel()}"{if $__microdata} itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"{/if}>
								<a href="{$breadcrumb->getURL()}"{if $__microdata} itemprop="url"{/if}><span{if $__microdata} itemprop="title"{/if}>{$breadcrumb->getLabel()}</span></a>
							</li>
						{/foreach}
				
						{event name='breadcrumbs'}
					{/content}
			</ul>
		</div>
	</div>
{/hascontent}
