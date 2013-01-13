class AddAgeToPrimaryChildren < ActiveRecord::Migration
  def change
    add_column :primary_children, :age, :integer

  end
end
