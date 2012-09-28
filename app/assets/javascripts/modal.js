jQuery(document).ready(function() {
  $j('a[data-remote]').click(function(e) {
    var url = $j(this).attr('href');
    var dialog_form = $j('<div id="dialog-form">Loading form...</div>').dialog({
      autoOpen: false,
      width: 520,
      modal: true,
      open: function() {
        return $j(this).load(url + ".js", function(data) {
          $j('#ui-dialog-title-dialog-form').text($j(this).attr('alias'));
          $j('.ui-dialog-titlebar-close').text('Закрыть');
        });
      },
      close: function() {
        $j('#dialog-form').remove();
      }
    });
    dialog_form.dialog('open');
    e.preventDefault();
  });
});
