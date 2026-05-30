require "active_record"

class CreateMotions < ActiveRecord::Migration[8.1]
  def change
    create_table :plenary_meetings do |t|
      t.integer :term
      t.integer :session_period
      t.integer :number
      t.string :name
      t.string :org
      t.string :proposer
      t.string :cosignatory
      t.string :status
      t.string :pdf_url
      t.string :doc_url
      t.timestamps null: false
    end
  end
end
