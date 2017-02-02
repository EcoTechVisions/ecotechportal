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

ActiveRecord::Schema.define(version: 20161219064113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohort_groups", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_cohort_groups_on_cohort_id", using: :btree
    t.index ["group_id"], name: "index_cohort_groups_on_group_id", using: :btree
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.date     "time_period"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_companies_on_owner_id", using: :btree
  end

  create_table "course_topics", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_topics_on_course_id", using: :btree
    t.index ["topic_id"], name: "index_course_topics_on_topic_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string   "favorable_type"
    t.integer  "favorable_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["favorable_type", "favorable_id"], name: "index_favorites_on_favorable_type_and_favorable_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "group_courses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_group_courses_on_course_id", using: :btree
    t.index ["group_id"], name: "index_group_courses_on_group_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "profile"
    t.string   "banner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "user_role"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_members_on_company_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "profileable_id"
    t.date     "founded"
    t.string   "skills"
    t.string   "languages"
    t.string   "about"
    t.text     "bio"
    t.string   "avatar"
    t.string   "banner"
    t.string   "theme_1"
    t.string   "theme_2"
    t.string   "email"
    t.string   "phone_number"
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.string   "industry"
    t.string   "category"
    t.string   "subcategory",                 array: true
    t.string   "slug"
    t.string   "tags",                        array: true
    t.string   "refnumber"
    t.string   "privacy"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["profileable_id"], name: "index_profiles_on_profileable_id", using: :btree
    t.index ["tags"], name: "index_profiles_on_tags", using: :gin
  end

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.text     "message"
    t.string   "directed_to"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "socials", force: :cascade do |t|
    t.string   "socialable_type"
    t.integer  "socialable_id"
    t.integer  "social_media"
    t.string   "social_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["socialable_type", "socialable_id"], name: "index_socials_on_socialable_type_and_socialable_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "timesheets", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.integer  "user_id"
    t.boolean  "timesheet_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_timesheets_on_user_id", using: :btree
  end

  create_table "topic_lessons", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_topic_lessons_on_lesson_id", using: :btree
    t.index ["topic_id"], name: "index_topic_lessons_on_topic_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "username"
    t.date     "age"
    t.string   "about"
    t.string   "photo"
    t.string   "banner"
    t.string   "theme"
    t.string   "phone_number"
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.string   "industry"
    t.string   "category"
    t.string   "privacy"
    t.string   "approved"
    t.integer  "role"
    t.string   "auth_token"
    t.json     "terms_of_use"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "weeks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
