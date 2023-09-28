class Lecture < ApplicationRecord
  belongs_to :course
  has_one_attached :lecture_video
  validates :video_title, presence: true, length: { maximum: 50 }
  validate :validate_lecture_video
  
  private

  def validate_lecture_video
    return unless lecture_video.attached?
    return if lecture_video.blob.content_type.in?(%w[video/mp4 video/mkv video/webm video/ogg])
    errors.add(:lecture_video, 'must be a video')
  end
end
