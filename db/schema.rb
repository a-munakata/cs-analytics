# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130925124814) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "answer_items", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "question_id"
    t.string   "sentence",           :limit => 200, :default => ""
    t.string   "placeholder",        :limit => 100, :default => ""
    t.float    "val",                               :default => 0.5
    t.boolean  "is_multiline",                      :default => false, :null => false
    t.boolean  "is_required",                       :default => false, :null => false
    t.boolean  "is_impression",                     :default => true,  :null => false
    t.integer  "answer_type",        :limit => 3,   :default => 1
    t.string   "validation_type",    :limit => 30
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "validation_pattern", :limit => 300, :default => "",    :null => false
  end

  add_index "answer_items", ["inbox_id"], :name => "index_answer_items_on_inbox_id"
  add_index "answer_items", ["question_id"], :name => "index_answer_items_on_question_id"

  create_table "answers", :force => true do |t|
    t.integer  "panel_id"
    t.integer  "question_id"
    t.integer  "answer_item_id"
    t.integer  "sub_item_id"
    t.integer  "answer_type",    :limit => 3
    t.string   "value",          :limit => 1000
    t.integer  "duration"
    t.float    "x"
    t.float    "y"
    t.float    "width"
    t.float    "height"
    t.integer  "impression",     :limit => 2
    t.boolean  "is_answered",                    :default => false, :null => false
    t.boolean  "is_timeout",                     :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "rank"
  end

  add_index "answers", ["panel_id"], :name => "index_answers_on_panel_id"
  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "collector_segment_chains", :force => true do |t|
    t.integer  "collector_id"
    t.integer  "segment_id"
    t.integer  "inbox_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "collector_segment_chains", ["inbox_id"], :name => "index_collector_segment_chains_on_inbox_id"
  add_index "collector_segment_chains", ["segment_id", "collector_id"], :name => "index_collector_segment_chains_on_segment_id_and_collector_id", :unique => true

  create_table "collectors", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "survey_id"
    t.string   "name",                                  :default => ""
    t.text     "description"
    t.boolean  "is_password",                           :default => false, :null => false
    t.boolean  "is_due",                                :default => false, :null => false
    t.boolean  "is_answer_limit",                       :default => false, :null => false
    t.boolean  "can_return",                            :default => false, :null => false
    t.boolean  "is_mail",                               :default => false, :null => false
    t.boolean  "is_result",                             :default => false, :null => false
    t.boolean  "is_activated",                          :default => false, :null => false
    t.boolean  "allow_billboard",                       :default => false, :null => false
    t.boolean  "allow_duplicate_machine",               :default => false, :null => false
    t.integer  "answer_limit"
    t.string   "password",                :limit => 32
    t.datetime "due"
    t.integer  "panels_count",                          :default => 0
    t.integer  "completed_panels_count",                :default => 0
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "unique_id",               :limit => 30
    t.boolean  "is_compact"
    t.boolean  "ban_mobile"
    t.string   "og_title"
    t.string   "og_description"
    t.string   "og_image"
    t.boolean  "is_ogp"
    t.boolean  "request_billboard"
  end

  add_index "collectors", ["inbox_id"], :name => "index_collectors_on_inbox_id"
  add_index "collectors", ["survey_id"], :name => "index_collectors_on_survey_id"
  add_index "collectors", ["unique_id"], :name => "index_collectors_on_unique_id", :unique => true

  create_table "concat_answers", :force => true do |t|
    t.text     "source"
    t.integer  "question_id"
    t.integer  "answer_item_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "concat_answers", ["answer_item_id"], :name => "index_concat_answers_on_answer_item_id"
  add_index "concat_answers", ["question_id"], :name => "index_concat_answers_on_question_id"

  create_table "creative_chains", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type", :null => false
    t.integer  "creative_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "creative_chains", ["creative_id"], :name => "index_creative_chains_on_creative_id"

  create_table "creatives", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "survey_id"
    t.string   "image"
    t.string   "trimming",              :limit => 10,  :default => "thumb"
    t.string   "name"
    t.integer  "width",                 :limit => 3,   :default => 400
    t.integer  "height",                :limit => 3,   :default => 400
    t.string   "text_color",            :limit => 100
    t.string   "strong_color",          :limit => 100
    t.float    "insole_brightness",                    :default => 0.5
    t.string   "background_color",      :limit => 100
    t.string   "background_position_x", :limit => 10
    t.string   "background_position_y", :limit => 10
    t.boolean  "background_repeat",                    :default => true,    :null => false
    t.boolean  "is_sample",                            :default => false,   :null => false
    t.boolean  "is_template",                          :default => false,   :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "original_remote_url"
    t.string   "background_size",                      :default => "auto"
    t.boolean  "is_awkward"
    t.integer  "priority"
  end

  add_index "creatives", ["inbox_id"], :name => "index_creatives_on_inbox_id"
  add_index "creatives", ["survey_id"], :name => "index_creatives_on_survey_id"

  create_table "designs", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "survey_id"
    t.integer  "theme_id"
    t.integer  "font_id"
    t.integer  "creative_id"
    t.integer  "google_font_id"
    t.string   "background_position_x", :limit => 10,  :default => "left"
    t.string   "background_position_y", :limit => 10,  :default => "top"
    t.string   "background_color",      :limit => 100, :default => "#f6f6f6"
    t.boolean  "background_repeat",                    :default => true,      :null => false
    t.integer  "font_size",             :limit => 3,   :default => 14
    t.string   "font_source",                          :default => ""
    t.string   "text_align",            :limit => 10,  :default => "left"
    t.string   "text_color",            :limit => 100
    t.string   "strong_color",          :limit => 100
    t.string   "layout_position",       :limit => 10,  :default => "center"
    t.float    "insole_brightness",                    :default => 0.5
    t.string   "theme_path"
    t.text     "published_source"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.string   "background_size",                      :default => "cover"
    t.boolean  "is_background_image"
    t.boolean  "is_font"
    t.boolean  "is_google_font"
    t.datetime "published_at"
    t.string   "custom_class"
  end

  add_index "designs", ["creative_id"], :name => "index_designs_on_creative_id"
  add_index "designs", ["font_id"], :name => "index_designs_on_font_id"
  add_index "designs", ["google_font_id"], :name => "index_designs_on_google_font_id"
  add_index "designs", ["inbox_id"], :name => "index_designs_on_inbox_id"
  add_index "designs", ["survey_id"], :name => "index_designs_on_survey_id", :unique => true
  add_index "designs", ["theme_id"], :name => "index_designs_on_theme_id"

  create_table "egressions", :force => true do |t|
    t.integer  "questionnaire_id"
    t.boolean  "is_redirect",                      :default => false
    t.string   "sentence",         :limit => 1000
    t.string   "redirect_url",     :limit => 200
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.text     "description"
    t.integer  "question_type",                    :default => 1
    t.integer  "inbox_id"
  end

  add_index "egressions", ["inbox_id"], :name => "index_egressions_on_inbox_id"
  add_index "egressions", ["questionnaire_id"], :name => "index_egressions_on_questionnaire_id", :unique => true

  create_table "font_categories", :force => true do |t|
    t.string   "name",       :limit => 30, :default => "", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "fonts", :force => true do |t|
    t.integer  "font_category_id"
    t.string   "name",             :limit => 100, :default => "", :null => false
    t.string   "source",                          :default => "", :null => false
    t.string   "image"
    t.integer  "order_index",      :limit => 3,   :default => 0
    t.integer  "font_size",        :limit => 3,   :default => 14
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "english_name"
  end

  add_index "fonts", ["font_category_id"], :name => "index_fonts_on_font_category_id"

  create_table "google_font_categories", :force => true do |t|
    t.string   "name",       :limit => 50, :default => "", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "google_fonts", :force => true do |t|
    t.integer  "google_font_category_id"
    t.string   "name",                    :limit => 50, :default => "", :null => false
    t.string   "source",                                :default => "", :null => false
    t.string   "import",                                :default => "", :null => false
    t.integer  "order_index",             :limit => 3,  :default => 0
    t.string   "image"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "google_fonts", ["google_font_category_id"], :name => "index_google_fonts_on_google_font_category_id"

  create_table "inbox_chains", :force => true do |t|
    t.integer  "user_id"
    t.integer  "inbox_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "inbox_chains", ["user_id", "inbox_id"], :name => "index_inbox_chains_on_user_id_and_inbox_id", :unique => true

  create_table "inboxes", :force => true do |t|
    t.string   "role_name",         :limit => 20, :default => "free"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "duplicating_count",               :default => 0
  end

  create_table "inboxes_roles", :id => false, :force => true do |t|
    t.integer "inbox_id"
    t.integer "role_id"
  end

  add_index "inboxes_roles", ["inbox_id", "role_id"], :name => "index_inboxes_roles_on_inbox_id_and_role_id"

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "description"
    t.boolean  "confirmed",   :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "inquiry_subjects", :force => true do |t|
    t.string   "name",           :limit => 50, :default => "",    :null => false
    t.boolean  "is_description",               :default => false, :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "inbox_id"
    t.string   "email"
    t.string   "share_token"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "invitations", ["inbox_id", "email"], :name => "index_inbox_invitations_on_inbox_id_and_email", :unique => true
  add_index "invitations", ["share_token"], :name => "index_inbox_invitations_on_share_token", :unique => true

  create_table "job_domains", :force => true do |t|
    t.string   "name",       :limit => 30, :default => "free"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "is_active"
    t.integer  "priority"
  end

  create_table "logics", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "destination_index", :limit => 3
    t.integer  "order_index",       :limit => 3, :default => 0
    t.boolean  "is_valid",                       :default => true, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "answer_item_id"
    t.integer  "destination_id"
  end

  add_index "logics", ["answer_id"], :name => "index_logics_on_answer_id"
  add_index "logics", ["answer_item_id"], :name => "index_logics_on_answer_item_id"
  add_index "logics", ["destination_id"], :name => "index_logics_on_destination_id"
  add_index "logics", ["inbox_id"], :name => "index_logics_on_inbox_id"
  add_index "logics", ["question_id"], :name => "index_logics_on_question_id"

  create_table "notifications", :force => true do |t|
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "permalink",  :limit => 50, :null => false
    t.text     "source",                   :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "panels", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "collector_id"
    t.integer  "current_index",       :limit => 3
    t.string   "order",               :limit => 1000
    t.datetime "start_at"
    t.datetime "complete_at"
    t.boolean  "is_invalid",                          :default => false, :null => false
    t.string   "custom_key"
    t.string   "ip_address",          :limit => 50
    t.string   "browser"
    t.string   "browser_version"
    t.string   "platform"
    t.string   "resolution",          :limit => 50
    t.boolean  "is_mobile",                           :default => false, :null => false
    t.boolean  "is_complete",                         :default => false, :null => false
    t.boolean  "is_screen_out",                       :default => false, :null => false
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "color",               :limit => 100,  :default => "",    :null => false
    t.float    "reply_time"
    t.boolean  "is_valid",                            :default => true,  :null => false
    t.string   "os_browser"
    t.integer  "current_question_id"
    t.string   "query_string"
  end

  add_index "panels", ["collector_id", "survey_id"], :name => "index_panels_on_session_id_and_collector_id_and_survey_id"
  add_index "panels", ["collector_id"], :name => "index_panels_on_collector_id"
  add_index "panels", ["current_question_id"], :name => "index_panels_on_current_question_id"
  add_index "panels", ["custom_key", "collector_id", "survey_id"], :name => "index_panels_on_custom_key_and_collector_id_and_survey_id", :unique => true
  add_index "panels", ["survey_id"], :name => "index_panels_on_survey_id"

  create_table "questionnaires", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "survey_id"
    t.integer  "current_order",   :limit => 3, :default => 0
    t.integer  "questions_count",              :default => 0
    t.text     "characters"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "questionnaires", ["inbox_id"], :name => "index_questionnaires_on_inbox_id"
  add_index "questionnaires", ["survey_id"], :name => "index_questionnaires_on_survey_id", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "questionnaire_id"
    t.string   "sentence",             :limit => 1000, :default => ""
    t.string   "placeholder",          :limit => 100,  :default => ""
    t.text     "description"
    t.integer  "question_type",        :limit => 3,    :default => 1
    t.integer  "answer_type",          :limit => 3,    :default => 1
    t.integer  "order_index",          :limit => 3,    :default => 0
    t.boolean  "is_range",                             :default => false, :null => false
    t.boolean  "is_shuffle",                           :default => false, :null => false
    t.integer  "range_max"
    t.integer  "range_min"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "is_expand",                            :default => false
    t.boolean  "is_timer"
    t.boolean  "is_logic"
    t.integer  "timer_value",                          :default => 5
    t.boolean  "is_required"
    t.string   "launcher_string"
    t.integer  "timer_destination_id"
  end

  add_index "questions", ["inbox_id"], :name => "index_questions_on_inbox_id"
  add_index "questions", ["questionnaire_id"], :name => "index_questions_on_questionnaire_id"
  add_index "questions", ["timer_destination_id"], :name => "index_questions_on_timer_destination_id"

  create_table "randomizers", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "questionnaire_id"
    t.integer  "order_index",                   :default => 0
    t.integer  "start_index",      :limit => 3
    t.integer  "end_index",        :limit => 3
    t.integer  "step_num",         :limit => 3
    t.boolean  "is_valid",                      :default => true, :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "randomizers", ["inbox_id"], :name => "index_randomizers_on_inbox_id"
  add_index "randomizers", ["questionnaire_id"], :name => "index_randomizers_on_questionnaire_id"

  create_table "raw_data", :force => true do |t|
    t.text     "source",     :limit => 16777215
    t.integer  "segment_id"
    t.integer  "inbox_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_deflate"
    t.binary   "bin",        :limit => 16777215
    t.text     "csv_source", :limit => 16777215
  end

  add_index "raw_data", ["inbox_id"], :name => "index_raw_data_on_inbox_id"
  add_index "raw_data", ["segment_id"], :name => "index_raw_data_on_segment_id"

  create_table "receipts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "subscription_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "data"
    t.string   "event_id"
  end

  add_index "receipts", ["event_id"], :name => "index_receipts_on_event_id", :unique => true
  add_index "receipts", ["user_id"], :name => "index_receipts_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "segment_filters", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "segment_id"
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "segment_filters", ["inbox_id"], :name => "index_segment_filters_on_inbox_id"
  add_index "segment_filters", ["question_id"], :name => "index_segment_filters_on_question_id"
  add_index "segment_filters", ["segment_id"], :name => "index_segment_filters_on_segment_id"

  create_table "segments", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "survey_id"
    t.string   "name",                  :limit => 100, :default => "",    :null => false
    t.datetime "due_start"
    t.datetime "due_end"
    t.boolean  "allow_screen_out",                     :default => false, :null => false
    t.boolean  "is_uncompleted",                       :default => false, :null => false
    t.boolean  "disallow_duplicate_ip",                :default => false, :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "is_making"
    t.datetime "make_at"
    t.boolean  "is_raw_data_error"
    t.string   "raw_data_error"
    t.string   "unique_id"
    t.string   "pass_phrase"
    t.boolean  "is_public"
  end

  add_index "segments", ["inbox_id"], :name => "index_segments_on_inbox_id"
  add_index "segments", ["survey_id"], :name => "index_segments_on_survey_id"
  add_index "segments", ["unique_id"], :name => "index_segments_on_unique_id", :unique => true

  create_table "sheets", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sub_items", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "sentence",        :limit => 200, :default => ""
    t.string   "placeholder",     :limit => 100, :default => ""
    t.integer  "answer_type",                    :default => 1
    t.integer  "order_index",                    :default => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "sub_items", ["attachable_id", "attachable_type"], :name => "index_sub_items_on_attachable_id_and_attachable_type"
  add_index "sub_items", ["inbox_id"], :name => "index_sub_items_on_inbox_id"

  create_table "surveys", :force => true do |t|
    t.integer  "inbox_id"
    t.string   "name",            :limit => 100, :default => ""
    t.string   "gift_code"
    t.integer  "questions_count",                :default => 0
    t.boolean  "is_published",                   :default => false, :null => false
    t.boolean  "is_gift",                        :default => false, :null => false
    t.boolean  "is_duplicating",                 :default => false, :null => false
    t.boolean  "is_deleted",                     :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "tag_color"
    t.integer  "panels_count"
  end

  add_index "surveys", ["gift_code"], :name => "index_surveys_on_gift_code", :unique => true
  add_index "surveys", ["inbox_id"], :name => "index_surveys_on_inbox_id"

  create_table "teaser_tokens", :force => true do |t|
    t.string   "key"
    t.integer  "remain_count"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "teaser_tokens", ["key"], :name => "index_teaser_tokens_on_key", :unique => true

  create_table "theme_categories", :force => true do |t|
    t.string   "name",       :limit => 100, :default => "", :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "themes", :force => true do |t|
    t.integer  "theme_category_id"
    t.integer  "creative_id"
    t.integer  "font_id"
    t.integer  "google_font_id"
    t.string   "name",              :limit => 100, :default => ""
    t.string   "source"
    t.string   "image"
    t.text     "description"
    t.string   "author",            :limit => 100, :default => ""
    t.integer  "order_index",                      :default => 0
    t.string   "text_align",        :limit => 10,  :default => "left"
    t.string   "layout_position",   :limit => 10,  :default => "center"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "background_color",  :limit => 100
    t.string   "text_color",        :limit => 10
    t.string   "strong_color",      :limit => 10
    t.string   "background_size",                  :default => "auto"
    t.boolean  "is_font"
    t.boolean  "is_google_font"
    t.boolean  "is_background"
    t.string   "custom_class"
  end

  add_index "themes", ["creative_id"], :name => "index_themes_on_creative_id"
  add_index "themes", ["font_id"], :name => "index_themes_on_font_id"
  add_index "themes", ["google_font_id"], :name => "index_themes_on_google_font_id"
  add_index "themes", ["theme_category_id"], :name => "index_themes_on_theme_category_id"

  create_table "timers", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "question_id"
    t.boolean  "is_valid",                       :default => false, :null => false
    t.integer  "second",            :limit => 3
    t.integer  "destination_index", :limit => 3
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "timers", ["inbox_id"], :name => "index_timers_on_inbox_id"
  add_index "timers", ["question_id"], :name => "index_timers_on_question_id", :unique => true

  create_table "tweets", :force => true do |t|
    t.string   "text"
    t.datetime "fetched_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "twitter_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "job_domain_id"
    t.integer  "inbox_id"
    t.integer  "account_id"
    t.string   "name",                   :limit => 30, :default => ""
    t.string   "plan_id",                :limit => 20, :default => "free"
    t.string   "customer_id"
    t.string   "last_4_digits",          :limit => 4
    t.boolean  "is_awkward",                           :default => false,  :null => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "email",                                :default => "",     :null => false
    t.string   "encrypted_password",                   :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.string   "completed_tutorial"
    t.boolean  "is_agree_eula"
    t.string   "api_token"
    t.integer  "invite_count",                         :default => 0
    t.string   "invite_token"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id", :unique => true
  add_index "users", ["api_token"], :name => "index_users_on_api_token", :unique => true
  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["inbox_id"], :name => "index_users_on_inbox_id"
  add_index "users", ["invite_token"], :name => "index_users_on_invite_token", :unique => true
  add_index "users", ["job_domain_id"], :name => "index_users_on_job_domain_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "waiters", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
