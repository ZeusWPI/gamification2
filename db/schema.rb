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

ActiveRecord::Schema[7.0].define(version: 2022_07_20_002035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coders", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "github_name", null: false
    t.string "avatar_url", null: false
    t.string "github_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commits", force: :cascade do |t|
    t.bigint "coder_id", null: false
    t.bigint "repository_id", null: false
    t.string "sha", null: false
    t.integer "additions", null: false
    t.integer "deletions", null: false
    t.datetime "committed_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "score", type: :integer, as: "round((ln(((additions + 1))::double precision) * (10)::double precision))", stored: true
    t.index ["coder_id"], name: "index_commits_on_coder_id"
    t.index ["repository_id"], name: "index_commits_on_repository_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "git_identities", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "coder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coder_id"], name: "index_git_identities_on_coder_id"
    t.index ["name", "email"], name: "index_git_identities_on_name_and_email", unique: true
  end

  create_table "organisation_members", force: :cascade do |t|
    t.string "organisation", null: false
    t.string "github_name", null: false
    t.index ["organisation", "github_name"], name: "index_organisation_members_on_organisation_and_github_name", unique: true
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.string "github_url", null: false
    t.string "clone_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organisation", null: false
  end

  add_foreign_key "commits", "coders"
  add_foreign_key "commits", "repositories"
  add_foreign_key "git_identities", "coders"
end
