function editDialog(e, xhr, status) {
  var url = $j(this).attr('href');
  var header = $j(this).attr('alias');
  var main = $j('#main');
  var dialog_form = $j('<div id="dialog-form">Загрузка формы...</div>').dialog({
    title: header,
    autoOpen: false,
    width: main.width()-20,
    position: { my: "right top", at: "right top", of: main },
//    position: [main.offset().left+20, -30],
    modal: true,
    resizable: false,
    draggable: false,
    zIndex : 500,
    minHeight: main.height(),
    closeText: 'x',
    open: function() {
      var form = $j('#dialog-form');
      form.html(xhr.responseText);
    },
    close: function() {
      $j('#dialog-form').remove();
    }
  });
  dialog_form.dialog('open');
  e.preventDefault();
}

