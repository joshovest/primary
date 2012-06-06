class PrimaryClass < ActiveRecord::Base
  attr_accessible :name
  has_many :primary_children, :dependent => :destroy
  
  validates :name, presence:true
end
