<base href="{$baseHref}" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="format-detection" content="telephone=no" />
{if $allowSpidersToIndexThisPage|empty}<meta name="robots" content="noindex,nofollow" />{/if}
{implode from=$__wcf->getMetaTagHandler() item=__metaTag glue="\n"}{@$__metaTag}{/implode}
{event name='metaTags'}

<!-- Stylesheets -->

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">

<!-- Vendor CSS for =US= Theme -->
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

<!-- Theme CSS for =US= Theme -->
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/theme.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/theme-elements.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/theme-blog.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/theme-shop.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/theme-animate.css">

<!-- Current Page CSS -->
<link rel="stylesheet" href="{@$__wcf->getPath()}js/us-theme/vendor/rs-plugin/css/settings.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}js/us-theme/vendor/rs-plugin/css/layers.css">
<link rel="stylesheet" href="{@$__wcf->getPath()}js/us-theme/vendor/rs-plugin/css/navigation.css">

{@$__wcf->getStyleHandler()->getStylesheet()}
{event name='stylesheets'}
<link rel="stylesheet" href="{@$__wcf->getPath()}style/us-theme/style.css">

{include file='headIncludeJavaScript'}

<script data-relocate="true">
	WCF.Language.addObject({
		{* dummy language item to preserve compatibility with WCF 2.0, move this to headIncludeJavaScript *}
		'wcf.global.error.title': '{lang}wcf.global.error.title{/lang}'
		
		{* DEPRECATED -- PLEASE USE javascriptLanguageImport@headIncludeJavaScript *}
		{event name='javascriptLanguageImport'}
	});
</script>

{* DEPRECATED -- PLEASE USE javascriptInclude@headIncludeJavaScript *}
{event name='javascriptInclude'}

<!-- Icons -->
<link rel="icon" href="{@$__wcf->getFavicon()}" type="image/x-icon" />
<link rel="apple-touch-icon" href="{@$__wcf->getPath()}images/apple-touch-icon.png" />

{* Currently unused javascript files included with the porto theme *}
{*
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery-cookie/jquery-cookie.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.validation/jquery.validation.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.stellar/jquery.stellar.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.gmap/jquery.gmap.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/isotope/jquery.isotope.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/circle-flip-slideshow/js/jquery.flipshow.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/vide/vide.min.js"></script>
*}

<!-- HERE I RESIDE -->
<script data-relocate="true" src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
<script data-relocate="true" src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script data-relocate="true" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script data-relocate="true" src="//cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/jquery.appear/jquery.appear.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/common/common.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/owl.carousel/owl.carousel.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/theme.js"></script>
<script data-relocate="true" src="{@$__wcf->getPath()}js/us-theme/theme.init.js"></script>

<script data-relocate="true">
	//<![CDATA[
	$(function() {
		{* DEPRECATED -- PLEASE USE javascriptInit@headIncludeJavaScript *}
		{event name='javascriptInit'}
	});
	//]]>
</script>

{include file='javascriptOverrides'}