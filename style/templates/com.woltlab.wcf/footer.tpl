				{event name='contents'}
				
				{if $skipBreadcrumbs|empty}{include file='breadcrumbs' __microdata=false}{/if}
				
				{if MODULE_WCF_AD && $__disableAds|empty}
					{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.footer.content')}
				{/if}
			</section>
		</div>
	</div>
</div>

<footer class="marginBottom-30">
	<div>				
		<div>
			{event name='footerContents'}
						
			<div class="container marginTop">
				<hr>
				<div class="grid" id="footerContent">
					<div class="row">
						<div class="col-md-6">
							<div>
								Built with <i class="fa fa-heart red"></i> by our Engineering Department
							</div>
							<div>
								{if ENABLE_BENCHMARK}{include file='benchmark'}{/if}
							</div>
						</div>
						<div class="col-md-6 text-right">
							<ul class="list-inline">
								<li>It is currently {@TIME_NOW|date:'j F Y, h:ia'}</li>
								<li>All times are <abbr title="Eastern Standard Time (UTC-5)">EST</abbr></li>
							</ul>
							<div>
								{event name='copyright'}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		{if MODULE_WCF_AD && $__disableAds|empty}
			{@$__wcf->getAdHandler()->getAds('com.woltlab.wcf.footer.bottom')}
		{/if}
	</div>
	
	{event name='endFooter'}
</footer>

{event name='afterFooter'}

<!-- JAVASCRIPT_RELOCATE_POSITION -->

{@FOOTER_CODE}

<a id="bottom"></a>
