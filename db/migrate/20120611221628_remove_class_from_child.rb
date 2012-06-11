class RemoveClassFromChild < ActiveRecord::Migration
  def change
    remove_column  :primary_children, :primary_class_id
    add_column :primary_classes, :age, :integer
  end
end
