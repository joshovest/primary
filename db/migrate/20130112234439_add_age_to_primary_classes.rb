class AddAgeToPrimaryClasses < ActiveRecord::Migration
  def change
    add_column :primary_classes, :age, :integer

  end
end
