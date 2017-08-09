	function copyToClipboard(element) {
	  var $temp = $("<input>");
	  $("body").append($temp);
	  $temp.val($(element).text()).select();
	  document.execCommand("copy");
	  $temp.remove();
	  $(".copy").html("<i class='material-icons'> assignment</i>已儲存至剪貼簿")
	}
$(document).ready(function() {
	eventListeners()
});

var eventListeners = function(){
	$("#search").on("click", animateSearchIcon)
}


// function animateSearchIcon() {
// 	console.log("sdfsdf")
// 	$(".nav-search" ).animate({
//     left: "+=100%",
//   }, 1, function() {
//     // Animation complete.
//   });
// }
