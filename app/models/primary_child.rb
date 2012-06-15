class PrimaryChild < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :birthday
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :birthday, presence:true
  
  def get_class_name
    if !self.birthday.nil?
      age = Time.now.year - self.birthday.year
      c = PrimaryClass.find_by_age(age, limit:1)
      c.name if !c.nil?
    end
  end
end
