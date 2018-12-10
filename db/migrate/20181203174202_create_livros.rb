class CreateLivros < ActiveRecord::Migration[5.0]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :isbn
      t.float :preco,           default: 0.0
      t.date :data_publicacao

      t.timestamps
    end
    add_index :livros, :titulo, unique: true
    add_index :livros, :isbn, unique: true
  end
end
