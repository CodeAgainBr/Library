class PagesController < ApplicationController
	def home
		@autores = Autor.all
		@livros = Livro.all
	end

	def update_livro
		@livro = Livro.new
		@livro.titulo = params[:titulo]
		@livro.isbn = params[:isbn]
		@livro.preco = params[:preco]
		@livro.data_publicacao = params[:publicacao]
		@livro.save
	end

	def update_autor
		@autor = Autor.new
		@autor.nome = params[:nome]
		@autor.save
	end

	def update_autor_livro
		@autor_livro = AutorLivro.new
		@autor_livro.autor = Autor.where(nome: params[:nome])[0]
		@autor_livro.livro = Livro.where(titulo: params[:titulo])[0]
		@autor_livro.save
	end
end