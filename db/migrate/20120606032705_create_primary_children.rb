class CreatePrimaryChildren < ActiveRecord::Migration
  def change
    create_table :primary_children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :primary_class_id
      t.date :birthday

      t.timestamps
    end
  end
end
