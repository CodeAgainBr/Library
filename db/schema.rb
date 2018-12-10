# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181203182722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autor_livros", force: :cascade do |t|
    t.integer  "autor_id"
    t.integer  "livro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_autor_livros_on_autor_id", using: :btree
    t.index ["livro_id"], name: "index_autor_livros_on_livro_id", using: :btree
  end

  create_table "autors", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_autors_on_nome", unique: true, using: :btree
  end

  create_table "livros", force: :cascade do |t|
    t.string   "titulo"
    t.string   "isbn"
    t.float    "preco",           default: 0.0
    t.date     "data_publicacao"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["isbn"], name: "index_livros_on_isbn", unique: true, using: :btree
    t.index ["titulo"], name: "index_livros_on_titulo", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "login"
    t.date     "data_nascimento"
    t.string   "cpf"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "autor_livros", "autors"
  add_foreign_key "autor_livros", "livros"
end
