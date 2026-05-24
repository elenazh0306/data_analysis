require "active_record"

class CreateCommitteeMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :committee_meetings do |t|
      t.string :name
      t.string :committee #meeting type
      t.string :content
      t.date :date
      t.timestamps null: false
      t.references :legislator, foreign_key: true
    end
  end
end
