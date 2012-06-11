class PrimaryClass < ActiveRecord::Base
  attr_accessible :name, :age
    
  validates :name, presence:true
  validates :age, presence:true, :inclusion => { :in => 3..11 } 
end
