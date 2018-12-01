class CreateAutors < ActiveRecord::Migration[5.0]
  def change
    create_table :autors do |t|
      t.string :nome

      t.timestamps
    end
  end

  add_index :autors, :nome, unique: true
end
