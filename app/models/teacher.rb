class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :admin_teacher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_photo
  validates :first_name, :last_name, :education, :birth_date, :gender, :profile_photo, presence: true
  validates :phone_no, presence: true, numericality: true, length: { is: 10 }
  validate :password_requirements, unless: -> { @admin_teacher || password.blank? }

  enum :gender, %i[male female]

  private
  def password_requirements
    rules = {
      'must contain at least one lowercase letter' => /[a-z]+/,
      'must contain at least one uppercase letter' => /[A-Z]+/,
      'must contain at least one digit' => /\d+/,
      'must contain at least one special character' => /[^A-Za-z0-9]+/
    }

    rules.each do |message, regex|
      errors.add(:password, message) unless password&.match(regex)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at education email first_name last_name birth_date gender]
  end
end
