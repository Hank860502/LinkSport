function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
  $(".copy").html("<i class='material-icons'> attach_file</i>已儲存至剪貼簿")
}



