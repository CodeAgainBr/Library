class AutorLivro < ApplicationRecord
  belongs_to :autor
  belongs_to :livro
end
