require "active_record"

class CreateBills < ActiveRecord::Migration[8.1]
  def change
    create_table :bills do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
