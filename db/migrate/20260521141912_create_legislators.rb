class CreateLegislators < ActiveRecord::Migration[8.1]
  def change
    create_table legislators: do |t|
      t.string :legislatorName
      t.string :legislatorDepartment
      t.timestamps null: false
    end
  end
end
