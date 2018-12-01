require 'test_helper'

class AutorControllerTest < ActionDispatch::IntegrationTest
  test "should get nome" do
    get autor_nome_url
    assert_response :success
  end

  test "should get livro:has_and_belongs_to_many" do
    get autor_livro:has_and_belongs_to_many_url
    assert_response :success
  end

end
