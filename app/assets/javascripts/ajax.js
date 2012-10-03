function editDialog(e, xhr, status) {
  url = $j(this).attr('href');
  header = $j(this).attr('alias');
  dialog_form = $j('<div id="dialog-form">Загрузка формы...</div>').dialog({
    autoOpen: false,
    width: 520,
    modal: true,
    title: $j(this).attr('alias'),
    closeText: 'Закрыть',
    open: function() {
      $j('#dialog-form').append($j(xhr.responseText).find('form'));
      $j('#dialog-form').html(xhr.responseText);
    },
    close: function() {
      $j('#dialog-form').remove();
    }
  });
  dialog_form.dialog('open');
  e.preventDefault();
}

