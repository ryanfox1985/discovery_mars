var PagesController = Paloma.controller('Pages');

PagesController.prototype.index = function(){
  $(document).on('ajax:success', 'form[data-remote]', function(e, data, status, xhr){
    $('[data-dom="results"]').html(data);
    $('[data-dom="modal"]').modal('show');
  });

  $(document).on('ajax:error', 'form[data-remote]', function(e, data, status, xhr){
    $('[data-dom="results"]').text("ERROR: " + data.responseJSON.error);
    $('[data-dom="modal"]').modal('show');
  });
};