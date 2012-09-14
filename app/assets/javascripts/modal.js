jQuery(document).ready(function() {
  $j('#create_truck').click(function(e) {
    var url = $j(this).attr('href');
    var dialog_form = $j('<div id="dialog-form">Loading form...</div>').dialog({
      autoOpen: false,
      width: 520,
      modal: true,
      open: function() {
        return $j(this).load(url + ' #main');
      },
      close: function() {
        $j('#dialog-form').remove();
      }
    });
    dialog_form.dialog('open');
    e.preventDefault();
  });
});
