class CreateBills < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :billName
      t.string :billProposer
      t.string :billCosignatory
      t.timestamps null: false
    end
  end
end
