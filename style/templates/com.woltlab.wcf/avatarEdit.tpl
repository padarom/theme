{include file='documentHeader'}

<head>
    <title>{lang}wcf.user.avatar.edit{/lang} - {lang}wcf.user.usercp{/lang} - {PAGE_TITLE|language}</title>
    
    {include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}" data-application="{$templateNameApplication}">

    {include file='userMenuSidebar'}

    {include file='header' title='wcf.user.avatar.edit'|language}

    <div class="container marginBottom-30 marginTop">
        <div class="col-md-3 no-padding-left">
            {include file='leftSidebar'}
        </div>

        <div class="col-md-9 no-padding-right">
            {include file='userNotice'}

            {if $__wcf->user->disableAvatar}
                <p class="alert alert-error">{lang}wcf.user.avatar.error.disabled{/lang}</p>
            {/if}

            {include file='formError'}

            {if $success|isset}
                <p class="alert alert-success">{lang}wcf.global.success.edit{/lang}</p>
            {/if}

            <div class="contentNavigation">
                {hascontent}
                    <nav>
                        <ul>
                            {content}
                                {event name='contentNavigationButtons'}
                            {/content}
                        </ul>
                    </nav>
                {/hascontent}
            </div>

            <form method="post" action="{link controller='AvatarEdit'}{/link}" id="avatarForm">
                <div>
                    <fieldset>
                        <legend>{lang}wcf.user.avatar{/lang}</legend>

                        <dl>
                            <dt></dt>
                            <dd>
                                <label><input type="radio" name="avatarType" value="none" {if $avatarType == 'none'}checked="checked" {/if}/> {lang}wcf.user.avatar.type.none{/lang}</label>
                                <small>{lang}wcf.user.avatar.type.none.description{/lang}</small>
                            </dd>
                        </dl>

                        {if $__wcf->getSession()->getPermission('user.profile.avatar.canUploadAvatar')}
                            <dl class="jsOnly{if $errorField == 'custom'} formError{/if}" id="avatarUpload">
                                <dt class="framed">
                                    {if $avatarType == 'custom'}
                                        {if $__wcf->getUserProfileHandler()->getAvatar()->canCrop()}
                                            {@$__wcf->getUserProfileHandler()->getAvatar()->getCropImageTag(96)}
                                        {else}
                                            {@$__wcf->getUserProfileHandler()->getAvatar()->getImageTag(96)}
                                        {/if}
                                    {else}
                                        <img src="{@$__wcf->getPath()}images/avatars/avatar-default.svg" alt="" class="icon96" />
                                    {/if}
                                </dt>
                                <dd>
                                    <label><input type="radio" name="avatarType" value="custom" {if $avatarType == 'custom'}checked="checked" {/if}/> {lang}wcf.user.avatar.type.custom{/lang}</label>
                                    <small>{lang}wcf.user.avatar.type.custom.description{/lang}</small>

                                    {* placeholder for upload button: *}
                                    <div></div>

                                    {if $errorField == 'custom'}
                                        <small class="innerError">
                                            {if $errorType == 'empty'}{lang}wcf.global.form.error.empty{/lang}{/if}
                                        </small>
                                    {/if}
                                </dd>
                            </dl>
                        {/if}

                        {if MODULE_GRAVATAR}
                            <dl{if $errorField == 'gravatar'} class="formError"{/if}>
                                <dt class="framed"><img src="https://secure.gravatar.com/avatar/{@$__wcf->user->email|strtolower|md5}?s=96{if GRAVATAR_DEFAULT_TYPE != '404'}&amp;d={@GRAVATAR_DEFAULT_TYPE}{/if}" alt="" class="icon96" /></dt>
                                <dd>
                                    <label><input type="radio" name="avatarType" value="gravatar" {if $avatarType == 'gravatar'}checked="checked" {/if}/> {lang}wcf.user.avatar.type.gravatar{/lang}</label>
                                    {if $errorField == 'gravatar'}
                                        <small class="innerError">
                                            {if $errorType == 'notFound'}{lang}wcf.user.avatar.type.gravatar.error.notFound{/lang}{/if}
                                        </small>
                                    {/if}
                                    <small>{lang}wcf.user.avatar.type.gravatar.description{/lang}</small>
                                </dd>
                            </dl>
                        {/if}

                        {event name='avatarFields'}
                    </fieldset>

                    {event name='fieldsets'}
                </div>

                {if !$__wcf->user->disableAvatar}
                    <div class="formSubmit">
						<button type="submit" class="btn btn-3d btn-primary">{lang}wcf.global.button.submit{/lang}</button>
                        {@SECURITY_TOKEN_INPUT_TAG}
                    </div>
                {/if}
            </form>
        </div>
    </div>

    {include file='footer'}

    {if $__wcf->getSession()->getPermission('user.profile.avatar.canUploadAvatar')}
        <script data-relocate="true">
            //<![CDATA[
            $(function() {
                WCF.Language.addObject({
                    'wcf.user.avatar.type.custom.crop': '{lang}wcf.user.avatar.type.custom.crop{/lang}',
                    'wcf.user.avatar.upload.error.invalidExtension': '{lang}wcf.user.avatar.upload.error.invalidExtension{/lang}',
                    'wcf.user.avatar.upload.error.tooSmall': '{lang}wcf.user.avatar.upload.error.tooSmall{/lang}',
                    'wcf.user.avatar.upload.error.tooLarge': '{lang}wcf.user.avatar.upload.error.tooLarge{/lang}',
                    'wcf.user.avatar.upload.error.uploadFailed': '{lang}wcf.user.avatar.upload.error.uploadFailed{/lang}',
                    'wcf.user.avatar.upload.error.badImage': '{lang}wcf.user.avatar.upload.error.badImage{/lang}',
                    'wcf.user.avatar.upload.success': '{lang}wcf.user.avatar.upload.success{/lang}'
                });

                {if !$__wcf->user->disableAvatar}
                    {if $__wcf->getUserProfileHandler()->getAvatar()->canCrop()}
                        new WCF.User.Avatar.Upload(0, new WCF.User.Avatar.Crop({@$__wcf->getUserProfileHandler()->getAvatar()->avatarID}));
                    {else}
                        new WCF.User.Avatar.Upload();
                    {/if}
                {/if}
            });
            //]]>
        </script>
    {/if}

</body>
</html>
