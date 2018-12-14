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

 		respond_to do |format|
	   	if @livro.save
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
			render json: @autor, status: :ok
   	end
	end

	def update_autor_livro
		@autor_livro = AutorLivro.new
		@autor_livro.autor = Autor.where(nome: params[:nome])[0]
		@autor_livro.livro = Livro.where(titulo: params[:livro])[0]

		if @autor_livro.save
			respond_to do |format|
		  	format.js { head :ok }
		 	end
   	end
	end

	def get_livro
		@livro = Array.new()
		if params[:titulo]
			@livro = Livro.where(titulo: params[:titulo])[0]
			@livro = Array.new([
				id: @livro.id,
				titulo: @livro.titulo,
				isbn: @livro.isbn,
				preco: @livro.preco,
				data_publicacao: @livro.data_publicacao,
				autores: AutorLivro.where(livro_id: @livro)
			])
		else
			@temp = Livro.all
			@livro = Array.new()
			@temp.each do |l|
				l = Array.new([
					id: l.id,
					titulo: l.titulo,
					isbn: l.isbn,
					preco: l.preco,
					data_publicacao: l.data_publicacao.strftime("%d/%m/%Y"),
					autores: AutorLivro.where(livro_id: l)
				])
				@livro.push(l[0])
			end
		end

		render json: @livro, status: :ok
	end

	def get_autor
		if params[:nome]
			@autor = Autor.where(nome: params[:nome])[0]
		else
			@autor = Autor.all
		end

		render json: @autor, status: :ok
	end

	def get_autor_livro
		if params[:titulo] == ""
			@autor_livro = AutorLivro.all
		else
			@livro = Livro.where(titulo: params[:titulo])[0]
			@autor_livro = AutorLivro.where(livro: @livro)
		end

		render json: @autor_livro, status: :ok
	end
end