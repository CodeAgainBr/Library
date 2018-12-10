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

		@erro = true

		if @livro.save
			tamanho = params[:listaAutores].lenght
			(0..tamanho).each do |autor|
				tmp = Autor.where(nome: autor)[0]
				@autor_livro = AutorLivro.new
				@autor_livro.autor = tmp
				@autor_livro.livro = @livro
				@autor_livro.save
				
				@erro = false 
			end
   	end

 		respond_to do |format|
	   	if @erro
		  	format.js { head :ok }
		  else
		  	format.js { head :bad_request }
	   	end
	 	end
	end

	def update_autor
		@autor = Autor.new
		@autor.nome = params[:nome]

		if @autor.save
			respond_to do |format|
		  	format.js { head :ok }
		 	end
   	end
	end

	def update_autor_livro
		@autor_livro = AutorLivro.new
		@autor_livro.autor = Autor.where(nome: params[:nome])[0]
		@autor_livro.livro = Livro.where(titulo: params[:titulo])[0]

		if @autor_livro.save
			respond_to do |format|
		  	format.js { head :ok }
		 	end
   	end
	end

	def get_livro
		@livro = Livro.where(titulo: params[:titulo])[0]
	end

	def get_autor
		@autor = Autor.where(nome: params[:nome])[0]
	end

	def get_autor_livro
		@autor = Autor.where(nome: params[:nome])[0]
		@livro = Livro.where(titulo: params[:titulo])[0]
		@autor_livro = AutorLivro.where(autor: @autor, livro: @livro)[0]
	end
end