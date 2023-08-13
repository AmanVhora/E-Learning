class CourseCategory < ApplicationRecord
  private
  
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
