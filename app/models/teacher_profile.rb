class TeacherProfile < ApplicationRecord
  belongs_to :teacher
  has_one_attached :profile_photo
end
