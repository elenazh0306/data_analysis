require "active_record"

class CreateMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :committee
      t.string :content
      t.timestamps null: false
      t.reference :legislators, foreign_key: true
    end
  end
end
