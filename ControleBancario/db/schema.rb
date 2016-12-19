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

ActiveRecord::Schema.define(version: 20161212150614) do

  create_table "cartoes", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "nome"
    t.string   "tipo_cartao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "limite_atual"
    t.float    "limite"
    t.index ["usuario_id"], name: "index_cartoes_on_usuario_id"
  end

  create_table "creditos", force: :cascade do |t|
    t.integer  "cartao_id"
    t.float    "valor_creditado"
    t.string   "local"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cartao_id"], name: "index_creditos_on_cartao_id"
  end

  create_table "debitos", force: :cascade do |t|
    t.integer  "usuario_id"
    t.float    "valor_debitado"
    t.string   "tipo_de_debito"
    t.string   "local"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "saldo_total"
    t.index ["usuario_id"], name: "index_debitos_on_usuario_id"
  end

  create_table "mensagens", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tipo"
    t.boolean  "status"
    t.index ["usuario_id"], name: "index_mensagens_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "endereco"
    t.string   "login"
    t.string   "senha"
    t.float    "limite_ce"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "saldo_total"
  end

end
