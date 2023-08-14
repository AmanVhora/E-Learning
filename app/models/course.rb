class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :course_category
  has_one_attached :course_thumbnail
  has_many :lectures
  accepts_nested_attributes_for :lectures, allow_destroy: true
end
