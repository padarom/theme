{include file='documentHeader'}
<head>
    <title>{lang}wcf.page.chaplain.title{/lang}</title>

    {include file='headInclude' sandbox=false}
</head>

<body id="tpl{$templateName|ucfirst}">
    {include file='header' title='{lang}wcf.page.chaplain.title{/lang}' light=true paddingBottom=30}

    <div class="light container marginTop">

        {include file='userNotice'}

        <div class="row">
            <div class="col-md-4">
				<div class="tabs tabs-vertical tabs-left tabs-navigation">
                    <ul class="nav nav-tabs col-sm-3">
                            <li class="active"><a href="#tabCategory1" data-toggle="tab">{lang}wcf.page.chaplain.mission.title{/lang}</a></li>
                            <!--<li><a href="#tabCategory2" data-toggle="tab">{lang}wcf.page.chaplain.news.title{/lang}</a></li>-->
                            <li><a href="#tabCategory3" data-toggle="tab">{lang}wcf.page.chaplain.leadership.title{/lang}</a></li>
                            <li><a href="#tabCategory4" data-toggle="tab">{lang}wcf.page.chaplain.resources.title{/lang}</a></li>
                    </ul>
                </div>
				
				<div style="text-align:center;margin-top:10px;"></div>
            </div>

            <div class="col-md-8">
                <div class="tab-pane tab-pane-navigation active" id="tabCategory1">
                    <h4 class="big">{lang}wcf.page.chaplain.mission.title{/lang}</h4>
                    <blockquote><p><img src="{lang}wcf.page.chaplain.icon{/lang}" style="width:150px;float:left;" />{lang}wcf.page.chaplain.mission.content{/lang}</p></blockquote>
                </div>
                
                <!--<div class="tab-pane tab-pane-navigation" id="tabCategory2">
                    <h4 class="big">{lang}wcf.page.chaplain.news.title{/lang}</h4>
                    <blockquote><p>{lang}wcf.page.chaplain.news.content{/lang}</p></blockquote>
                </div>-->
                
                <div class="tab-pane tab-pane-navigation" id="tabCategory3">
                    <h4 class="big">{lang}wcf.page.chaplain.leadership.title{/lang}</h4>
                    <blockquote>
						<ol class="containerList userList">
							{foreach from=$userProfiles item=user}
								{include file='userListItem'}
							{/foreach}
						</ol>
					</blockquote>
                </div>
                
                <div class="tab-pane tab-pane-navigation" id="tabCategory4">
                    <h4 class="big">{lang}wcf.page.chaplain.resources.title{/lang}</h4>
                    <blockquote><p>{lang}wcf.page.chaplain.resources.content{/lang}</p></blockquote>
                </div>
            </div>
        </div>

    </div>

    {include file='footer' skipBreadcrumbs=true}
</body>
</html>