class CreatePrimaryClasses < ActiveRecord::Migration
  def change
    create_table :primary_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
