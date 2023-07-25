class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_photo
  validates :first_name, :last_name, :education, :birth_date, :gender, presence: true
  validates :phone_no, presence: true, numericality: true, length: { is: 10 }
  validate :password_requirements

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

  def self.ransackable_associations(auth_object = nil)
    %w[profile_photo_attachment profile_photo_blob]
  end

  def self.ransackable_attributes(auth_object = nil)
    # %w[birth_date created_at education email encrypted_password first_name gender id last_name phone_no profile_photo remember_created_at reset_password_sent_at reset_password_token updated_at]
    %w[created_at education email first_name last_name]
  end
end
