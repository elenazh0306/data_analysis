require "active_record"

class CreatePlenaryMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :plenary_meetings do |t|
      t.string :name
      t.string :content
      t.date :date
      t.timestamps null: false
      t.references :legislator, foreign_key: true
    end
  end
end
