ActiveRecord::Schema[8.1].define(version: 2014_10_25_152200) do
  create_table "posts", force: :cascade do |t|
    t.string "billCosignatory", default: nil
    t.string "billName", default: nil
    t.string "billProposer", default: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
