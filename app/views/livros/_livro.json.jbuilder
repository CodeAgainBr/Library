json.extract! livro, :id, :titulo, :isbn, :preco, :data_publicacao, :created_at, :updated_at
json.url livro_url(livro, format: :json)
