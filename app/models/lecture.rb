class Lecture < ApplicationRecord
  belongs_to :course
  has_one_attached :lecture_video
  validates :video_title, presence: true, length: { maximum: 50 }
end
