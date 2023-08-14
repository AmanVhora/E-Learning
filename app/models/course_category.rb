class CourseCategory < ApplicationRecord
  has_many :courses
  
  private
  
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
