class Course < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :teacher
  belongs_to :course_category
  has_one_attached :course_thumbnail
  has_many :lectures, dependent: :destroy
  accepts_nested_attributes_for :lectures, allow_destroy: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :caption, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :language, presence: true
  enum :language, {
    english: 1, hindi: 2, arabic: 3, russian: 4, turkish: 5, spanish: 6, urdu: 7, french: 8, japanese: 9, german: 10, italian: 11, greek: 12, portugese: 13, korean:14, dutch: 15, chinese: 16, latin: 17, farsi: 18, bengali: 19, gujarati: 20
  }

  def total_duration
    total_duration = 0
    self.lectures.each do |lecture|
      total_duration += lecture.lecture_video.metadata.fetch(:duration, 0)
    end
    distance_of_time_in_words(total_duration)
  end
end
