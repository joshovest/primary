class PrimaryChild < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :birthday, :primary_class_id
  belongs_to :primary_class
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :birthday, presence:true
  validates :primary_class_id, presence:true
end
