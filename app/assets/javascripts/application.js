//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap
//= require font_awesome5
//= require toastr

toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-bottom-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "50",
  "hideDuration": "500",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
};


// code Leo

$(document).ready(function() {
  $('#datatable').DataTable( {
    "language": {
      "decimal":        "",
      "emptyTable":     "Nenhum livro disponível na tabela.",
      "info":           "Mostrando _START_ até _END_ de _TOTAL_ livros",
      "infoEmpty":      "Sem livros disponíveis.",
      "infoFiltered":   "(de um total de _MAX_ livros)",
      "infoPostFix":    "",
      "thousands":      ",",
      "lengthMenu":     "Mostrar _MENU_ livros",
      "loadingRecords": "Carregando...",
      "processing":     "Processando...",
      "search":         "Procurar Livro:",
      "zeroRecords":    "Nenhum Livro encontrado",
      "paginate": {
        "first":      "Prim.",
        "last":       "Últ.",
        "next":       "Próx.",
        "previous":   "Ant."
      },
    },
  });

  $('#autor').on('change', function() {
    if($(this).find(":checked").val() == "Adicionar novo Autor") {
      $('.novo-autor-row').removeClass('d-none');
    } else {
      $('.novo-autor-row').addClass('d-none');
    }
    if($(this).find(":checked").val() != "Escolha um Autor" && $(this).find(":checked").val() != "Adicionar novo Autor") {
      $('#autor-list').append(`<li class="list-group-item">${$(this).find(":checked").val()}<i class="remover-autor fa fa-times ml-1"></i></li>`);
      $('.remover-autor').click(function() {
        $(this).parent('.list-group-item').remove();
      });       
    }
  });

  $('.btn-salvar-autor').click(function() {
    if($('#nome_autor').val() != "") {
      $('#autor').append(`<option>${$('#nome-autor').val()}</option>`);
      $('#autor-list').append(`<li class="list-group-item">${$('#nome-autor').val()}<i class="remover-autor fa fa-times ml-1"></i></li>`);
      $('#nome-autor').val('');
      $('.lista_autores').removeClass('d-none');
      $('.remover-autor').click(function() {
        $(this).parent('.list-group-item').remove();
      });     
    }
  });
});
