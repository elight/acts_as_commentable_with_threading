ActiveRecord::Schema.define(version: 1) do
  create_table 'users', force: true, &:timestamps

  create_table 'commentables', force: true, &:timestamps

  create_table "comments", force: true do |t|
    t.integer "commentable_id", default: 0
    t.string "commentable_type", limit: 15, default: ""
    t.string "title", default: ""
    t.text "body", default: ""
    t.string "subject", default: ""
    t.references "commenter", polymorphic: true
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.timestamps
  end

  add_index "comments", "commenter_id"
  add_index "comments", "commentable_id"
end
