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
  $('#datatable').DataTable({
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
    }
  });

  $('#autor').on('change', function() {
    if($(this).find(":checked").val() == "Adicionar novo Autor") {
      $('.novo-autor-row').removeClass('d-none');
    } else {
      $('.novo-autor-row').addClass('d-none');

      if($(this).find(":checked").val() != "Escolha um Autor") {
        setAuthor($(this).find(":checked").val());
      }
    }
  });
});

function addBook() {
  titulo = $("#txt_titulo_livro").val();
  isbn = $("#txt_isbn_livro").val();
  preco = $("#txt_preco_livro").val();
  publicacao = $("#txt_publicacao_livro").val();
  listaAutores = $(".list-group-item");


  if (titulo != "" && isbn != "" && preco != 0.0 && publicacao != "" && listaAutores[0] != "") {
    $.ajax({
      url: "/update/livro",
      data: {
        titulo: titulo,
        isbn: isbn,
        preco: preco,
        publicacao: publicacao
      },
      success: function(result){
        toastr["success"]("Livro cadastrado com sucesso.");
        for (var i = 0; i < listaAutores.length; i++) {
          setAutorLivro(listaAutores[i].id, titulo);
        }
      },
      error: function() {
        toastr["warning"]("Falha ao cadastrar livro.");
      }
    });
  } else {
    toastr["warning"]("Campos não preenchidos!");
  }
}

function getBooks(){var books = "";
  $.get({url: "/get/livro"});
}

function updateBooksList() {
  $(document).ajaxComplete(function( event, xhr, settings ) {
    if(settings.url === "/get/livro") {
      table = $("#datatable").DataTable();
      table.clear();

      books = JSON.parse(xhr.responseText)

      console.log(books);

      for(var i = 0; i < books.length; i++) {
        temp = books[i];
        authors = "";
        for(var j = 0; j < temp.autores.length; j++) {
          authors += temp.autores[j].nome
          if(temp.autores.length-1 != j) {
            authors += ", ";
          }
        }
        book = [temp.titulo, temp.isbn, temp.preco + "", temp.data_publicacao, authors];
        table.row.add(book).draw();
      }
    }
  });
  getBooks();
}

function addAuthor() {
  autor = $("#nome-autor").val();
  $("#nome-autor").val("");
  $(".novo-autor-row").addClass("d-none");

  if(autor != "") {
    listaAutores[listaAutores.lenght] = $("#nome-autor").val();
    $.ajax({
      url: "/update/autor/" + autor,
      success: function(result, status, xhr) {
        toastr["success"]("Autor cadastrado com sucesso.");
      },
      error: function(erro) {
        toastr["warning"]("Falha ao cadastrar autor.");
      }
    });
  } else {
    toastr["warning"]("Campo não preenchido!");
  }

  setAuthor(autor);
  getAuthors();
}

function setAuthor(name) {
  if(typeof($("#"+name)) !== "undefined") {
    $('#autor-list').append('<li id="'+name+'" class="list-group-item">'+name+'<span class="remover-autor"><i class="fa fa-times ml-1"></i></span></li>');
    $('.lista-autores').removeClass('d-none');
    $('#'+name+' .remover-autor').click(function() {
      $('#'+name).remove();

      if($('#autor-list').html() == "") {
        $('.lista-autores').addClass('d-none');
      }
    });
  }
}

function getAuthors(){
  $.ajax({
    url: "/get/autor",
    method: "get",
    dataType: "json",
    success: function(result, status, xhr){
      updateAuthorsList(result);
    }
  });
}

function setAutorLivro(autor, livro) {
  $.ajax({
    url: "/update/autor_livro",
    data: {nome: autor, livro: livro}
  });
}
