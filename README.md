## Unknown Soldiers Forum Theme
This is the official theme used by the Unknown Soldiers battlefield clan, including all assets and templates.

This theme relies on a lot of plugins also developed by the Unknown Soldiers and the other way around. All of our plugins have been built specifically for this theme, so their visuals might not look as expected without having this theme installed first.

The assets include parts of the Porto theme for which Unknown Soldiers owns a valid license. If anyone besides Unknown Soldiers were to use this theme, they are legally obligated to also purchase a license of said theme, which can be obtained [here](https://themeforest.net/item/porto-responsive-html5-template/4106987).

### Usage
Installation is straightforward and works like every other plugin. Updating the theme unfortunately isn't quite as easy. Every time you update the plugin and include the `style` PIP, WCF will create a new style and a new template group for you. The new style is going to be set as default automatically (as specified in the `package.xml`), but you will need to remove the old style, as well as the old template group to prevent cluttering of the ACP. 

After removing all old template groups, your newest group (e.g. `=US= Dark Theme_2`) should be renamed so it's just `=US= Dark Theme`. This makes sure that you can distinguish the new template group from old groups, as the newest one will always be that with the highest number in the end.

In addition the update process will create a new folder for the new style version (`wcf/images/us-themeX`). Old folders should be removed again to prevent clutter, although usually these are automatically removed when deleting a style. If you rename the folder of the newest style, make sure to edit the style in the ACP and set the image folder path accordingly.

As this is a rather complicated procedure for small changes my recommendation is to synchronize the local folders (such as templates, images, style) to the server and work directly via file sync.

## Packaging
It is highly recommended to use a task runner such as [wspackager](https://github.com/padarom/wspackager) to package this theme.