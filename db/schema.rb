# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_06_152901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agendamentos", force: :cascade do |t|
    t.string "cliente_nome"
    t.datetime "created_at", null: false
    t.datetime "data_hora"
    t.bigint "negocio_id", null: false
    t.text "observacao"
    t.bigint "servico_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["negocio_id"], name: "index_agendamentos_on_negocio_id"
    t.index ["servico_id"], name: "index_agendamentos_on_servico_id"
  end

  create_table "custos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "data", null: false
    t.string "descricao"
    t.bigint "negocio_id", null: false
    t.bigint "servico_id"
    t.integer "tipo", default: 0, null: false
    t.datetime "updated_at", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.index ["negocio_id"], name: "index_custos_on_negocio_id"
    t.index ["servico_id"], name: "index_custos_on_servico_id"
  end

  create_table "negocios", force: :cascade do |t|
    t.string "categoria"
    t.datetime "created_at", null: false
    t.string "nome"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_negocios_on_user_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "categoria"
    t.datetime "created_at", null: false
    t.decimal "custo_direto", precision: 10, scale: 2
    t.decimal "custo_fixo_rateado", precision: 10, scale: 2
    t.text "descricao"
    t.bigint "negocio_id", null: false
    t.string "nome"
    t.decimal "percentual_imprevisto", precision: 5, scale: 2
    t.decimal "percentual_margem", precision: 5, scale: 2
    t.decimal "preco_calculado", precision: 10, scale: 2
    t.decimal "preco_final", precision: 10, scale: 2
    t.integer "tempo_estimado_minutos"
    t.datetime "updated_at", null: false
    t.decimal "valor_hora", precision: 10, scale: 2
    t.index ["negocio_id"], name: "index_servicos_on_negocio_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agendamentos", "negocios"
  add_foreign_key "agendamentos", "servicos"
  add_foreign_key "custos", "negocios"
  add_foreign_key "custos", "servicos"
  add_foreign_key "negocios", "users"
  add_foreign_key "servicos", "negocios"
end
