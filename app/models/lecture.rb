class Lecture < ApplicationRecord
  belongs_to :course
  has_many_attached :lecture_videos
end
