require "active_record"

class CreateVotes < ActiveRecord::Migration[8.1]
  def change
    create_table :plenary_meetings do |t|
      t.integer :term
      t.integer :session_period
      t.integer :session_times
      t.string :name
      t.date :date
      t.string :vote_issue
      t.string :vote_type
      t.integer :presence
      t.integer :agree
      t.integer :against
      t.integer :abstain
      t.string :supporter
      t.string :opposer
      t.string :abstainer
      t.timestamps null: false

    end
  end
end
