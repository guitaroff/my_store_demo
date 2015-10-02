jQuery ($) ->
  $('.deleteAction').click ->
    current_item_tr = $(this).parents('tr')
    if confirm('Точно удалить?')
      $.ajax
        url: '/items/' + current_item_tr.attr('data-item-id')
        type: 'POST'
        data: _method: 'DELETE'
        success: (result) ->
          $(current_item_tr).fadeOut 200
          console.log result
          return
    return
  return
