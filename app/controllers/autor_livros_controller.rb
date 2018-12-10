class AutorLivrosController < ApplicationController
  before_action :set_autor_livro, only: [:show, :edit, :update, :destroy]

  # GET /autor_livros
  # GET /autor_livros.json
  def index
    @autor_livros = AutorLivro.all
  end

  # GET /autor_livros/1
  # GET /autor_livros/1.json
  def show
  end

  # GET /autor_livros/new
  def new
    @autor_livro = AutorLivro.new
  end

  # GET /autor_livros/1/edit
  def edit
  end

  # POST /autor_livros
  # POST /autor_livros.json
  def create
    @autor_livro = AutorLivro.new(autor_livro_params)

    respond_to do |format|
      if @autor_livro.save
        format.html { redirect_to @autor_livro, notice: 'Autor livro was successfully created.' }
        format.json { render :show, status: :created, location: @autor_livro }
      else
        format.html { render :new }
        format.json { render json: @autor_livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autor_livros/1
  # PATCH/PUT /autor_livros/1.json
  def update
    respond_to do |format|
      if @autor_livro.update(autor_livro_params)
        format.html { redirect_to @autor_livro, notice: 'Autor livro was successfully updated.' }
        format.json { render :show, status: :ok, location: @autor_livro }
      else
        format.html { render :edit }
        format.json { render json: @autor_livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autor_livros/1
  # DELETE /autor_livros/1.json
  def destroy
    @autor_livro.destroy
    respond_to do |format|
      format.html { redirect_to autor_livros_url, notice: 'Autor livro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autor_livro
      @autor_livro = AutorLivro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def autor_livro_params
      params.require(:autor_livro).permit(:autor_id, :livro_id)
    end
end
