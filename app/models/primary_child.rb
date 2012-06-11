class PrimaryChild < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :birthday
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :birthday, presence:true
end
