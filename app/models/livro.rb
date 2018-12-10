class Livro < ApplicationRecord
	has_many :autor_livro, dependent: :delete_all
end
