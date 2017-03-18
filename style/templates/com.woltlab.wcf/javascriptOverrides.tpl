<script data-relocate="true">
	WCF.Dropdown.Interactive.Instance = WCF.Dropdown.Interactive.Instance.extend({
		open: function() {
			this._super();
			this._triggerElement.addClass('open');
		},
		
		close: function() {
			this._super();
			this._triggerElement.removeClass('open');
		}
	});
	WCF.Tagging.TagList = WCF.Tagging.TagList.extend({
		addItem: function(data) {
			// enforce max length by trimming values
			if (!data.objectID && data.label.length > this._maxLength) {
				data.label = data.label.substr(0, this._maxLength);
			}

			if (WCF.inArray(data.label, this._data)) {
				return true;
			}

			var $listItem = $('<li class="label label-default">' + WCF.String.escapeHTML(data.label) + '</li>').data('objectID', data.objectID).data('label', data.label).appendTo(this._itemList);
			$listItem.click($.proxy(this._click, this));

			if (this._search) {
				this._search.addExcludedSearchValue(data.label);
			}

			this._addItem(data.objectID, data.label);

			return true;
		}
  	});
	
	/*
	WCF.Message.DefaultPreview = WCF.Message.DefaultPreview.extend({
		_handleResponse: function(data) {
			var $preview = $('#previewContainer');
			if (!$preview.length) {
				$preview = $('<div class="marginTop" id="previewContainer"><fieldset><legend>' + WCF.Language.get('wcf.global.preview') + '</legend><div class="messageTextPreview"></div></fieldset>').prependTo($('#messageContainer')).wcfFadeIn();
			}

			$preview.find('div:eq(0)').html(data.returnValues.message);

			new WCF.Effect.Scroll().scrollTo($preview);
		}
	});
	*/
  
	WCF.Upload = WCF.Upload.extend({
		_createButton: function() {
			if (this._supportsAJAXUpload) {
				this._fileUpload = $('<input type="file" name="' + this._name + '" ' + (this._options.multiple ? 'multiple="true" ' : '') + '/>');
				this._fileUpload.change($.proxy(this._upload, this));
				var $button = $('<p class="btn btn-sm btn-3d btn-secondary uploadButton"><span>' + WCF.Language.get('wcf.global.button.upload') + '</span></p>');
				$button.prepend(this._fileUpload);
			}
			else {
				var $button = $('<p class="btn btn-sm btn-3d btn-secondary uploadFallbackButton"><span>' + WCF.Language.get('wcf.global.button.upload') + '</span></p>');
				$button.click($.proxy(this._showOverlay, this));
			}

			this._insertButton($button);
		}
	});
	
	WCF.System.Confirmation._createDialog = function() {
		this._dialog = $('<div id="wcfSystemConfirmation" class="systemConfirmation"><p /><div id="wcfSystemConfirmationContent" /></div>').hide().appendTo(document.body);
		var $formButtons = $('<div class="formSubmit" />').appendTo(this._dialog);
		
		this._confirmationButton = $('<button class="btn btn-3d btn-primary">' + WCF.Language.get('wcf.global.confirmation.confirm') + '</button>').data('action', 'confirm').click($.proxy(this._click, this)).appendTo($formButtons);
		$('<button class="btn btn-3d btn-secondary">' + WCF.Language.get('wcf.global.confirmation.cancel') + '</button>').data('action', 'cancel').click($.proxy(this._click, this)).appendTo($formButtons);
	};

  
  var UNKSO = { };
  UNKSO.Ajax = { };

  UNKSO.Ajax.Popup = Class.extend({
    _popup: null,

    _proxy: null,

    _link: null,
    
    init: function(link) {
      var self = this;
      this._link = link;

      link.on('click', function(e) {
        e.preventDefault();
        
        self.open();
      });

      var $userID = link.data('userID');
      this._proxy = new WCF.Action.Proxy({
        showLoadingOverlay: true,
        dataType: 'html',
        data: {
          actionName: 'getUserAwards',
          className: 'wcf\\data\\award\\issued\\IssuedAwardAction',
          objectIDs: [ $userID ]
        }
      });
    },

    open: function() {
      var self = this;
      
      this._proxy.setOption('success', function(data, textStatus, jqXHR) {
        $("<div>" + data + "</div>").wcfDialog({ title: 'Hello!', onShow: function() {
          console.log("Hai");
        }});
      });

      this._proxy.sendRequest();
    }
  });
  
  WCF.Effect.BalloonTooltip = WCF.Effect.BalloonTooltip.extend({
  	_mouseEnterHandler: function(event) {
		var $element = $(event.currentTarget);
		if ($element.data('delay')) {
			var superCall = $.proxy(this._super, this);
			this._timeout = setTimeout(function() { superCall(event); }, $element.data('delay'));
		} else {
			this._super(event);
		}
	},
	
  	_mouseLeaveHandler: function(event) {
		if (this._timeout) {
			clearTimeout(this._timeout);
		}
		
		this._super(event);
	}
  });
</script>