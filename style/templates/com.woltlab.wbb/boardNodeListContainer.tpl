{if $boardNodeList->valid()}
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			new WBB.Board.MarkAsRead();
					
			WBB.Board.MyCollapsible = WBB.Board.Collapsible.extend({
				_getButtonContainer: function(containerID) {
					return this._containers[containerID].find('li.header div.list-inner').first();
				},
				
				_createButton: function(containerID, buttonContainer) {
					var $isOpen = this._containers[containerID].data('isOpen');
					var $button = $('<span class="jsTooltip collapseButton pointer icon icon16 fa fa-chevron-down" title="'+WCF.Language.get('wcf.global.button.collapsible')+'"></span>').prependTo(buttonContainer);
					$button.data('containerID', containerID).click($.proxy(this._toggleContainer, this));
					
					return $button;
				},
				
				_success: function(data, textStatus, jqXHR) {				
					// validate container id
					if (!data.returnValues.containerID) return;
					var $containerID = data.returnValues.containerID;
					
					// check if container id is known
					if (!this._containers[$containerID]) return;
					
					// update content storage
					this._containerData[$containerID].isOpen = (data.returnValues.isOpen) ? true : false;
					var $newState = (data.returnValues.isOpen) ? 'open' : 'close';
					
					// update container content
					this._updateContent($containerID, $.trim(data.returnValues.content), $newState);
				}
			});
			
			new WBB.Board.MyCollapsible('wbb\\data\\board\\BoardAction');
		});
		//]]>
	</script>
	
	<div>
		<ul class="wbbBoardList" id="forums-wrap">
			{include file='boardNodeList' application='wbb'}
		</ul>
	</div>
{/if}