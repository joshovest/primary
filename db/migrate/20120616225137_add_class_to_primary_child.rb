class AddClassToPrimaryChild < ActiveRecord::Migration
  def change
    add_column  :primary_children, :primary_class_id, :integer
    remove_column :primary_classes, :age
  end
end
