class CreateAutorLivros < ActiveRecord::Migration[5.0]
  def change
    create_table :autor_livros do |t|
      t.belongs_to :autor, foreign_key: true
      t.belongs_to :livro, foreign_key: true

      t.timestamps
    end
  end
end
