Affirm = {
  Views: {}
}

$(function() {
  $('[data-view]').each(function() {
    var path     = $(this).data('view').split('.'),
        ViewNode = Affirm.Views;
    while (path.length > 0) {
      ViewNode = ViewNode[path.shift()];
    }
    new ViewNode({ el: this });
  })
});
