require 'test_helper'

class AutorLivrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autor_livro = autor_livros(:one)
  end

  test "should get index" do
    get autor_livros_url
    assert_response :success
  end

  test "should get new" do
    get new_autor_livro_url
    assert_response :success
  end

  test "should create autor_livro" do
    assert_difference('AutorLivro.count') do
      post autor_livros_url, params: { autor_livro: { autor_id: @autor_livro.autor_id, livro_id: @autor_livro.livro_id } }
    end

    assert_redirected_to autor_livro_url(AutorLivro.last)
  end

  test "should show autor_livro" do
    get autor_livro_url(@autor_livro)
    assert_response :success
  end

  test "should get edit" do
    get edit_autor_livro_url(@autor_livro)
    assert_response :success
  end

  test "should update autor_livro" do
    patch autor_livro_url(@autor_livro), params: { autor_livro: { autor_id: @autor_livro.autor_id, livro_id: @autor_livro.livro_id } }
    assert_redirected_to autor_livro_url(@autor_livro)
  end

  test "should destroy autor_livro" do
    assert_difference('AutorLivro.count', -1) do
      delete autor_livro_url(@autor_livro)
    end

    assert_redirected_to autor_livros_url
  end
end
