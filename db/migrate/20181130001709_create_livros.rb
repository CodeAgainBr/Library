class CreateLivros < ActiveRecord::Migration[5.0]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.float :preco,         default: 0.0
      t.string :isbn
      t.date :data_publicacao

      t.timestamps
    end
  end

  add_index :livros, :titulo, unique: true
  add_index :livros, :isvn, 	unique: true
end
