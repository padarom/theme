{include file='documentHeader'}

<head>
    <title>{PAGE_TITLE|language}</title>
    
    {include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

    <div class="content-wrapper">
        {include file='headerOffline'}

        <div class="container" style="margin-top: 80px; margin-bottom: 80px;">
            <div class="row">
                <div class="col-md-12 center" style="margin-top: 20px;">
                    <h1 class="mb-sm small">MAINTENANCE MODE</h1>
                    <p class="lead">{@OFFLINE_MESSAGE|language}</p>
                </div>
            </div>
        </div>

        {include file='footer' skipBreadcrumbs=true}
    </div>
</body>
</html>