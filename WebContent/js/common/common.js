function gf_goPage(formName, pageNumber) {
	var $form = $('#' + formName );	
	$form.find("input[name='page']").val(pageNumber);
	$form.submit();
	
	return false;
}

var cPopupMask = function() {
    var mask = {};
    
    var winHeight = $(window).height();
    
    mask.width  = document.documentElement.scrollWidth;
	mask.height = winHeight >= document.documentElement.scrollHeight ? winHeight: document.documentElement.scrollHeight;
	
	return {
		show : function(){
		    $("#popup_mask").css({'width':mask.width,'height':mask.height, "z-index":50});  
		    $("#popup_mask").fadeTo(0,0.2);
		    
		    $(window).resize(function() {
		    	var mask_width = document.documentElement.scrollWidth;
		    	var mask_height = document.documentElement.scrollHeight;
				$("#popup_mask").css({'width':mask_width,'height':mask_height});
			});
		},
		hide:function(){
			$("#popup_mask").fadeOut(0);
		}
	};
};

var cLayer = function(layerId, closeSelector, closeCallback) {
	var id = layerId;
	var popupMask = cPopupMask();
	
	if( closeSelector != null ) {
		if( closeCallback != null ) {
			$(closeSelector).click(function() {
				if( closeCallback() ) {
					$("#" + id).hide();
					popupMask.hide();
				}
				return false;
			});
		} else {
			$(closeSelector).click(function() {
				$("#" + id).hide();
				popupMask.hide();
				return false;
			});
		}
	}
	
	return {
		show : function() {
			popupMask.show();
			
			var $win = $(window);
			var $layer = $("#" + id);
			
			var x = $win.scrollLeft() + ($win.width()/2) - ($layer.outerWidth()/2);
			var y = $win.scrollTop() + ((($win.height()/2) - ($layer.outerHeight()/2))*0.8);
			
			$layer.css({"position":"absolute", "z-index":99, "left":x, "top":y});			
			$layer.show().focus();			
		}
	
		, hide : function() {
			 $("#" + id).hide();
			 popupMask.hide();
		}
	};
};


var cAjaxLoadingAnimation = {
	show : function() {
		if( $("#loadingIndicator").is(":visible") ) {
			return;
		} 
		
		cPopupMask().show();
		
		var $win = $(window);
		var width =	$win.width();
		var height= $win.height();
		
	    var popupWidth = 100;
	    var popupHeight = 100;
	    var popupX = $win.scrollLeft() + ($win.width()/2) - (popupWidth/2);
	    var popupY = $win.scrollTop() + ((($win.height()/2) - (popupHeight/2))*0.8);
	    
	    $("#loadingIndicator").css({"position":"absolute", 'width':popupWidth,'min-height':popupHeight,'left':popupX,'top':popupY}).show().focus();
	}
	, hide : function() {
		if( $("#loadingIndicator").is(":hidden") ) {
			return;
		}
		
		$("#loadingIndicator").hide();
		cPopupMask().hide();
	}
};

