
function popupOpen($this) {
	$this.fadeIn(200);
	$(".dim").fadeIn(400);
}
function popupClose($this) {
	$this.fadeOut(400);
	$(".dim").fadeOut(200);
}

$(function(){
	$(".popup .close").on("click", function(e){
		e.preventDefault();
		popupClose($(this).closest(".popup"));
	});
	$("#todo-list > button").on("click", function(){
		$("#todo-list").toggleClass("on");
	});

	$(".drop-list a").on("click", function(e){
		e.preventDefault();
		$(this).closest(".drop-list").siblings(".selec-drop:not('.filter')").html($(this).html());
		$(this).closest(".drop-list").slideUp(400);
	});

	$(".ipt").each(function(){
		var rOnly;
		var $this = $(this);
		var $label = $this.find("label");
		var $text = $(".ipt-txt, .ipt-pw", this)
		var $val = $text.val();
		var editType = $this.find(".btn-edit").length;
		if ($text.val() != "") {
			$label.hide();
		}

		if ($text.attr("readonly") == "readonly"){
			$text.closest(".box").addClass("readonly");
		}

		$text.on("focusin", function(){
			if (!$(this).prop("readonly")){
				$this.addClass("focus");
				$label.hide();
			}
		}).on("focusout", function(){
			if (editType){
				$this.find(".box").addClass("readonly");
				$text.prop("readonly", true);
			}
			if ($(this).val() == $val) {
				$this.removeClass("focus");
				$label.hide();
			}
			if ($(this).val() == ""){
				$label.show();
			}
		});

		$(".btn-cancel", this).on("click", function(){
			$text.val($val);
			$this.removeClass("focus");
			$label.hide();
			if (rOnly){
				$this.find(".box").addClass("readonly");
				$text.prop("readonly", true);
			}
		});

		$(".btn-edit", this).on("click", function(){
			rOnly = $text.prop("readonly");
			$text.prop("readonly", false).focus();
			$(this).closest(".box").removeClass("readonly");
		});

		$(".btn-del", this).on("click", function(){
			$this.remove();
		});
	});

	$(".ipt-search, .ipt-time").each(function(){
		var $this = $(this);
		var $ipt = $this.find("input[type=text]");
		var $label = $this.find("label");
		if ($ipt.val() != "") {
			$this.addClass("focus");
		}
		$ipt.on("focusin", function(){
			$this.addClass("focus");
		}).on("focusout", function(){
			if ($(this).val() == "") {
				$this.removeClass("focus");
			}
		});
	});

	$(".alert-box .del").on("click", function(){
		$(this).closest("li").fadeOut(400);
	});

	$("#nav .depth").on("click", function(e){
		$(this).toggleClass("on");
		$(this).next("ul").stop().slideToggle(400);
	});
	// input file
	$(".ipt-file .input-file").on("change", function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.input-fake').val(filename);
	});

	// 등록 승인 요청 Wi-Fi 리스트 팝업
	$(".wifi-registe .btn-approve").on("click", function(){
		$(this).closest(".btn-warp").find(".pop-approve").show();
	});
	$(".wifi-registe .pop-approve .btn-close").on("click", function(){
		$(this).closest(".pop-approve").hide();
	});

	// btn-toggle
	$(".btn-toggle input[type='checkbox']").on("change",function(){
		$(this).toggleClass("checked");
	});

	// check-circle
	$(".check-circle").each(function(){
		if($(this).hasClass("disabled")){
			$(this).find("input").attr("disabled","disabled");
		} else {
			$(this).find("input[type='checkbox']").on("change", function(){
				$(this).closest(".check-circle").toggleClass("on");
			});
		};
	});

	$(".selec-drop").on("click", function(e){
		e.preventDefault();
		$(this).siblings(".drop-list").slideToggle(300);
	});

	$(".time-chk-box.graph a").on("click", function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		$(".time-chk-box.graph a").removeClass("on");
		$(this).addClass("on");
		$(href).show().siblings(".cont").hide();
	});

	// calendar
	$(".calendar .btn-cal").datepicker({
		showOptions: { direction: "up" },
		dateFormat: 'mm월 dd일 (D)',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		showOtherMonths: true,
		selectOtherMonths: true,
		yearSuffix: '년',
		maxDate: '0',
	});

	var today = new Date();
	$(".calendar .btn-cal").datepicker('setDate', today);

	$(".calendar .btn-prev").on("click", function () {
		var date = $(".calendar .btn-cal").datepicker('getDate', '+1d');
		date.setDate(date.getDate()-1);
		console.log(date)
		$(".calendar .btn-cal").datepicker('setDate', date);
		return false;
	});
	$(".calendar .btn-next").on("click", function () {
		var date = $(".calendar .btn-cal").datepicker('getDate', '+1d');
		date.setDate(date.getDate()+1);
		$(".calendar .btn-cal").datepicker('setDate', date);
		return false;
	});

});
